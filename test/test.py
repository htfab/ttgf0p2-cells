import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.handle import Force, Release
import random
import itertools
import os

async def check_cell_pin(dut, cell_pin, io_pairs, lenient=False):
    dut.clk.value = 0
    dut.rst_n.value = 1
    dut.ena.value = 1
    dut.page.value = cell_pin // 8
    for i, o in io_pairs:
        dut.cell_in.value = i
        await ClockCycles(dut.clk, 2)
        assert dut.uio_out.value == 0
        assert dut.uio_oe.value == 0
        r = dut.uo_out.value[cell_pin%8]
        istr = bin(i)[2:].rjust(6, '0')
        ostr = 'any' if o is None else str(o)
        info = f"cell_pin {cell_pin} input {istr} output {r} expected {ostr}"
        if lenient and str(r) == 'x' and o is not None:
            # workaround for incorrect rtl simulation of short-circuits involving x'es
            dut._log.info(info + " (ignored for sequential logic in rtl mode)")
        else:
            dut._log.info(info)
            assert o is None or r == o

def auto_iter(in_iter):
    try:
        return iter(in_iter)
    except TypeError:
        return iter((in_iter,))

def expand_dict(in_dict):
    return {p: v for k, v in in_dict.items() for p in auto_iter(k)}

def randomize_unused_pins(num_inputs, orig_tests, repeat=None, seed=None):
    if repeat is None:
        repeat = 5
    if seed is None:
        seed = 383
    rnd = random.Random(seed)
    mask = -(1 << num_inputs)
    tests = list(orig_tests)
    for rep in range(1, repeat):
        for i, o in orig_tests:
            tests.append((rnd.randrange(64) & mask | i & ~mask, o))
    return tuple(tests)

def comb(func, repeat=None, seed=None):
    # combinational logic
    num_inputs = func.__code__.co_argcount
    tests = []
    for inputs in itertools.product(range(2), repeat=num_inputs):
        inp_bin = sum(j << i for i, j in enumerate(inputs))
        out = func(*inputs)
        if out is not None:
            out &= 1
        tests.append((inp_bin, out))
    return randomize_unused_pins(num_inputs, tests, repeat, seed), False

def latch(invert_output, invert_data, has_reset, has_set, repeat=None, seed=None):
    num_inputs = 2
    # bits of the most general latch: set_b reset_b gate data
    pre_tests = [(0b1110, 0), (0b1111, 1), (0b1110, 0), (0b1100, 0), (0b1101, 0), (0b1111, 1), (0b1101, 1), (0b1100, 1)]
    if has_reset:
        num_inputs += 1
        pre_tests.extend([(0b1000, 0), (0b1100, 0), (0b1110, 0), (0b1111, 1), (0b1101, 1), (0b1100, 1)])
    if has_set:
        num_inputs += 1
        pre_tests.extend([(0b0100, 1), (0b1100, 1), (0b1110, 0), (0b1111, 1), (0b1101, 1), (0b1100, 1)])
    tests = []
    for i, o in pre_tests:
        if not has_set:
            i = i & 0b0111
        if not has_reset:
            i = (i & 0b1000) >> 1 | i & 0b0011
        if invert_data:
            i ^= 0b10
        if invert_output:
            o ^= 1
        tests.append((i, o))
    return randomize_unused_pins(num_inputs, tests, repeat, seed), True

def clock_gate(has_scanchain, invert_clock, repeat=None, seed=None):
    if has_scanchain:
        num_inputs = 3
        pre_tests = [(0b000, 0), (0b001, 0), (0b011, 0), (0b010, 0), (0b011, 1), (0b010, 0), (0b011, 1), (0b001, 1), (0b000, 0), (0b001, 0),
                     (0b000, 0), (0b001, 0), (0b101, 0), (0b100, 0), (0b101, 1), (0b100, 0), (0b101, 1), (0b001, 1), (0b000, 0), (0b001, 0)]
    else:
        num_inputs = 2
        pre_tests = [(0b00, 0), (0b01, 0), (0b11, 0), (0b10, 0), (0b11, 1), (0b10, 0), (0b11, 1), (0b01, 1), (0b00, 0), (0b01, 0)]
    tests = []
    for i, o in pre_tests:
        if invert_clock:
            i ^= 0b001
            o ^= 1
        tests.append((i, o))
    return randomize_unused_pins(num_inputs, tests, repeat, seed), True

def flop(invert_output, invert_clock, has_reset, has_set, has_loopback, has_scanchain, repeat=None, seed=None):
    num_inputs = 2
    # bits of the most general flip-flop: sce scd de set_b reset_b data clock
    pre_tests = [(0b0011100, None), (0b0011101, 0), (0b0011110, 0), (0b0011111, 1), (0b0011100, 1), (0b0011101, 0)]
    if has_reset:
        num_inputs += 1
        pre_tests.extend([(0b0011110, 0), (0b0011111, 1), (0b0011010, 0), (0b0011011, 0)])
    if has_set:
        num_inputs += 1
        pre_tests.extend([(0b0010100, 1), (0b0010101, 1), (0b0011100, 1), (0b0011101, 0)])
    if has_loopback:
        num_inputs += 1
        pre_tests.extend([(0b0011110, 0), (0b0011111, 1), (0b0001100, 1), (0b0001101, 1),
                          (0b0011100, 1), (0b0011101, 0), (0b0001110, 0), (0b0001111, 0)])
    if has_scanchain:
        num_inputs += 2
        pre_tests.extend([(0b1111100, 0), (0b1111101, 1), (0b0111100, 1), (0b0111101, 0),
                          (0b0011110, 0), (0b0011111, 1), (0b1011110, 1), (0b1011111, 0)])
    tests = []
    for i, o in pre_tests:
        if not has_scanchain:
            i = i & 0b0011111
        if not has_loopback:
            i = (i & 0b1100000) >> 1 | i & 0b0001111
        if not has_set:
            i = (i & 0b1110000) >> 1 | i & 0b0000111
        if not has_reset:
            i = (i & 0b1111000) >> 1 | i & 0b0000011
        if invert_clock:
            i = (i & 0b1111110) | ~i & 0b0000001
        if invert_output and o is not None:
            o ^= 1
        tests.append((i, o))
    return randomize_unused_pins(num_inputs, tests, repeat, seed), True

def tristate(test_type, repeat=None, seed=None):
    if test_type == 0:
        num_inputs = 6
        tests = [(0b000001, 0), (0b000011, 1), (0b000100, 0), (0b001100, 1), (0b010000, 0), (0b110000, 1)]
    elif test_type == 1:
        num_inputs = 6
        tests = [(0b000001, 1), (0b000011, 0), (0b000100, 1), (0b001100, 0), (0b010000, 1), (0b110000, 0)]
    elif test_type == 2:
        num_inputs = 4
        tests = [(0b0001, 0), (0b0011, 1), (0b0100, 1), (0b1100, 0)]
    else:
        assert False
    return randomize_unused_pins(num_inputs, tests, repeat, seed), False

@cocotb.test()
async def test_cells(dut):
    dut._log.info("start")
    gatelevel = os.environ.get('GATES') == 'yes'

    clock = Clock(dut.clk, 20, unit='us')
    cocotb.start_soon(clock.start())

    pin_mapping = expand_dict({
        (0,): 'tieh',
        (1,): 'tiel',
        (2, 3, 4, 5, 6, 7, 8, 9): 'buf',
        (10, 11, 12, 13, 14, 15, 16, 17): 'inv',
        (18, 19, 20): 'and2',
        (21, 22, 23): 'and3',
        (24, 25, 26): 'and4',
        (27, 28, 29): 'nand2',
        (30, 31, 32): 'nand3',
        (33, 34, 35): 'nand4',
        (36, 37, 38): 'or2',
        (39, 40, 41): 'or3',
        (42, 43, 44): 'or4',
        (45, 46, 47): 'nor2',
        (48, 49, 50): 'nor3',
        (51, 52, 53): 'nor4',
        (54, 55, 56): 'xor2',
        (57, 58, 59): 'xor3',
        (60, 61, 62): 'xnor2',
        (63, 64, 65): 'xnor3',
        (66, 67, 68): 'a21oi',
        (69, 70, 71): 'a22oi',
        (72, 73, 74): 'a211oi',
        (75, 76, 77): 'a221oi',
        (78, 79, 80): 'a222oi',
        (81, 82, 83): 'o21ai',
        (84, 85, 86): 'o22ai',
        (87, 88, 89): 'o31ai',
        (90, 91, 92): 'o32ai',
        (93, 94, 95): 'o33ai',
        (96, 97, 98): 'o211ai',
        (99, 100, 101): 'o221ai',
        (102, 103, 104): 'o222ai',
        (105, 107, 109): 'ha.COUT',
        (106, 108, 110): 'ha.SUM',
        (111, 113, 115): 'fa.COUT',
        (112, 114, 116): 'fa.SUM',
        (117, 118, 119): 'mux2',
        (120, 121, 122): 'mux4',
        (123, 124, 125): 'dlxtp',
        (126, 127, 128): 'dlrtp',
        (129, 130, 131): 'dlstp',
        (132, 133, 134): 'dlbtp',
        (135, 136, 137): 'dfxtp',
        (138, 139, 140): 'dfrtp',
        (141, 142, 143): 'dfstp',
        (144, 145, 146): 'dfbtp',
        (147, 148, 149): 'dfxtn',
        (150, 151, 152): 'dfrtn',
        (153, 154, 155): 'dfstn',
        (156, 157, 158): 'dfbtn',
        (159, 160, 161): 'sdfxtp',
        (162, 163, 164): 'sdfrtp',
        (165, 166, 167): 'sdfstp',
        (168, 169, 170): 'sdfbtp',
        (171, 172, 173, 174, 175): 'tiel',  # tristate cells are disabled on this shuttle
        (176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187): 'dlygate',
        (188, 189, 190, 191, 192, 193, 194, 195): 'clkbuf',
        (196, 197, 198, 199, 200, 201, 202, 203): 'clkinv',
        (204, 205, 206): 'sdlclkp',
        (207, 208, 209): 'sdlclkn',
    })

    cell_mapping = {
        'ha.COUT': 'and2',
        'ha.SUM': 'xor2',
        'fa.COUT': 'maj3',
        'fa.SUM': 'xor3',
        'fah.COUT': 'maj3',
        'fah.SUM': 'xor3',
        'fahcin.COUT': 'maj3#b',
        'fahcin.SUM': 'xnor3',
        'fahcon.COUT_N': 'maj3#i',
        'fahcon.SUM': 'xor3',
        'ebufn*3+sh': 'ebufn*3',
        'einvn*3+sh': 'einvn*3',
        'dlxbp.Q': 'dlxtp',
        'dlxbp.Q_N': 'dlxtp#i',
        'dlxbn.Q': 'dlxtn',
        'dlxbn.Q_N': 'dlxtn#i',
        'dlrbp.Q': 'dlrtp',
        'dlrbp.Q_N': 'dlrtp#i',
        'dlrbn.Q': 'dlrtn',
        'dlrbn.Q_N': 'dlrtn#i',
        'dfxbp.Q': 'dfxtp',
        'dfxbp.Q_N': 'dfxtp#i',
        'dfrbp.Q': 'dfrtp',
        'dfrbp.Q_N': 'dfrtp#i',
        'dfsbp.Q': 'dfstp',
        'dfsbp.Q_N': 'dfstp#i',
        'dfbbp.Q': 'dfbtp#',
        'dfbbp.Q_N': 'dfbtp#i',
        'dfbbn.Q': 'dfbtn#',
        'dfbbn.Q_N': 'dfbtn#i',
        'edfxbp.Q': 'edfxtp',
        'edfxbp.Q_N': 'edfxtp#i',
        'sdfxbp.Q': 'sdfxtp',
        'sdfxbp.Q_N': 'sdfxtp#i',
        'sdfrbp.Q': 'sdfrtp',
        'sdfrbp.Q_N': 'sdfrtp#i',
        'sdfsbp.Q': 'sdfstp',
        'sdfsbp.Q_N': 'sdfstp#i',
        'sdfbbp.Q': 'sdfbtp#',
        'sdfbbp.Q_N': 'sdfbtp#i',
        'sdfbbn.Q': 'sdfbtn#',
        'sdfbbn.Q_N': 'sdfbtn#i',
        'sedfxbp.Q': 'sedfxtp',
        'sedfxbp.Q_N': 'sedfxtp#i',
        'ebufn+ebufp': 'mux2',
        'einvn+einvp': 'mux2i',
        'dlygate': 'buf',
        'dlymetal': 'buf',
        'clkbuf': 'buf',
        'clkinv': 'inv',
        'clkinvlp': 'inv',
        'clkdlybuf': 'buf',
        'lpflow_inputiso0p': 'and2b#r',
        'lpflow_inputiso0n': 'and2',
        'lpflow_inputiso1p': 'or2',
        'lpflow_inputiso1n': 'or2b',
        'lpflow_inputisolatch': 'dlxtp',
        'lpflow_isobufsrc': 'and2b#r',
    }

    pin_tests = {
        'tiel':      comb(lambda: 0),
        'tieh':      comb(lambda: 1),
        'buf':       comb(lambda a: a),
        'inv':       comb(lambda a: ~a),
        'and2':      comb(lambda a,b: a & b),
        'and2b':     comb(lambda a,b: ~a & b),
        'and2b#r':   comb(lambda a,b: a & ~b),
        'and3':      comb(lambda a,b,c: a & b & c),
        'and3b':     comb(lambda a,b,c: ~a & b & c),
        'and4':      comb(lambda a,b,c,d: a & b & c & d),
        'and4b':     comb(lambda a,b,c,d: ~a & b & c & d),
        'and4bb':    comb(lambda a,b,c,d: ~a & ~b & c & d),
        'nand2':     comb(lambda a,b: ~(a & b)),
        'nand2b':    comb(lambda a,b: ~(~a & b)),
        'nand3':     comb(lambda a,b,c: ~(a & b & c)),
        'nand3b':    comb(lambda a,b,c: ~(~a & b & c)),
        'nand4':     comb(lambda a,b,c,d: ~(a & b & c & d)),
        'nand4b':    comb(lambda a,b,c,d: ~(~a & b & c & d)),
        'nand4bb':   comb(lambda a,b,c,d: ~(~a & ~b & c & d)),
        'or2':       comb(lambda a,b: a | b),
        'or2b':      comb(lambda a,b: a | ~b),
        'or3':       comb(lambda a,b,c: a | b | c),
        'or3b':      comb(lambda a,b,c: a | b | ~c),
        'or4':       comb(lambda a,b,c,d: a | b | c | d),
        'or4b':      comb(lambda a,b,c,d: a | b | c | ~d),
        'or4bb':     comb(lambda a,b,c,d: a | b | ~c | ~d),
        'nor2':      comb(lambda a,b: ~(a | b)),
        'nor2b':     comb(lambda a,b: ~(a | ~b)),
        'nor3':      comb(lambda a,b,c: ~(a | b | c)),
        'nor3b':     comb(lambda a,b,c: ~(a | b | ~c)),
        'nor4':      comb(lambda a,b,c,d: ~(a | b | c | d)),
        'nor4b':     comb(lambda a,b,c,d: ~(a | b | c | ~d)),
        'nor4bb':    comb(lambda a,b,c,d: ~(a | b | ~c | ~d)),
        'xor2':      comb(lambda a,b: a ^ b),
        'xor3':      comb(lambda a,b,c: a ^ b ^ c),
        'xnor2':     comb(lambda a,b: ~(a ^ b)),
        'xnor3':     comb(lambda a,b,c: ~(a ^ b ^ c)),
        'a2111o':    comb(lambda a,b,c,d,e: (a & b) | c | d | e),
        'a2111oi':   comb(lambda a,b,c,d,e: ~((a & b) | c | d | e)),
        'a211o':     comb(lambda a,b,c,d: (a & b) | c | d),
        'a211oi':    comb(lambda a,b,c,d: ~((a & b) | c | d)),
        'a21bo':     comb(lambda a,b,c: (a & b) | ~c),
        'a21boi':    comb(lambda a,b,c: ~((a & b) | ~c)),
        'a21o':      comb(lambda a,b,c: (a & b) | c),
        'a21oi':     comb(lambda a,b,c: ~((a & b) | c)),
        'a221o':     comb(lambda a,b,c,d,e: (a & b) | (c & d) | e),
        'a221oi':    comb(lambda a,b,c,d,e: ~((a & b) | (c & d) | e)),
        'a222oi':    comb(lambda a,b,c,d,e,f: ~((a & b) | (c & d) | (e & f))),
        'a22o':      comb(lambda a,b,c,d: (a & b) | (c & d)),
        'a22oi':     comb(lambda a,b,c,d: ~((a & b) | (c & d))),
        'a2bb2o':    comb(lambda a,b,c,d: (~a & ~b) | (c & d)),
        'a2bb2oi':   comb(lambda a,b,c,d: ~((~a & ~b) | (c & d))),
        'a311o':     comb(lambda a,b,c,d,e: (a & b & c) | d | e),
        'a311oi':    comb(lambda a,b,c,d,e: ~((a & b & c) | d | e)),
        'a31o':      comb(lambda a,b,c,d: (a & b & c) | d),
        'a31oi':     comb(lambda a,b,c,d: ~((a & b & c) | d)),
        'a32o':      comb(lambda a,b,c,d,e: (a & b & c) | (d & e)),
        'a32oi':     comb(lambda a,b,c,d,e: ~((a & b & c) | (d & e))),
        'a41o':      comb(lambda a,b,c,d,e: (a & b & c & d) | e),
        'a41oi':     comb(lambda a,b,c,d,e: ~((a & b & c & d) | e)),
        'o2111a':    comb(lambda a,b,c,d,e: (a | b) & c & d & e),
        'o2111ai':   comb(lambda a,b,c,d,e: ~((a | b) & c & d & e)),
        'o211a':     comb(lambda a,b,c,d: (a | b) & c & d),
        'o211ai':    comb(lambda a,b,c,d: ~((a | b) & c & d)),
        'o21ba':     comb(lambda a,b,c: (a | b) & ~c),
        'o21bai':    comb(lambda a,b,c: ~((a | b) & ~c)),
        'o21a':      comb(lambda a,b,c: (a | b) & c),
        'o21ai':     comb(lambda a,b,c: ~((a | b) & c)),
        'o221a':     comb(lambda a,b,c,d,e: (a | b) & (c | d) & e),
        'o221ai':    comb(lambda a,b,c,d,e: ~((a | b) & (c | d) & e)),
        'o222ai':    comb(lambda a,b,c,d,e,f: ~((a | b) & (c | d) & (e | f))),
        'o22a':      comb(lambda a,b,c,d: (a | b) & (c | d)),
        'o22ai':     comb(lambda a,b,c,d: ~((a | b) & (c | d))),
        'o2bb2a':    comb(lambda a,b,c,d: (~a | ~b) & (c | d)),
        'o2bb2ai':   comb(lambda a,b,c,d: ~((~a | ~b) & (c | d))),
        'o311a':     comb(lambda a,b,c,d,e: (a | b | c) & d & e),
        'o311ai':    comb(lambda a,b,c,d,e: ~((a | b | c) & d & e)),
        'o31a':      comb(lambda a,b,c,d: (a | b | c) & d),
        'o31ai':     comb(lambda a,b,c,d: ~((a | b | c) & d)),
        'o32a':      comb(lambda a,b,c,d,e: (a | b | c) & (d | e)),
        'o32ai':     comb(lambda a,b,c,d,e: ~((a | b | c) & (d | e))),
        'o33a':      comb(lambda a,b,c,d,e,f: (a | b | c) & (d | e | f)),
        'o33ai':     comb(lambda a,b,c,d,e,f: ~((a | b | c) & (d | e | f))),
        'o41a':      comb(lambda a,b,c,d,e: (a | b | c | d) & e),
        'o41ai':     comb(lambda a,b,c,d,e: ~((a | b | c | d) & e)),
        'maj3':      comb(lambda a,b,c: a + b + c >= 2),
        'maj3#b':    comb(lambda a,b,c: a + b + 1-c >= 2),
        'maj3#i':    comb(lambda a,b,c: a + b + c < 2),
        'mux2':      comb(lambda a,b,c: (a, b)[c]),
        'mux2i':     comb(lambda a,b,c: (~a, ~b)[c]),
        'mux4':      comb(lambda a,b,c,d,e,f: (a, b, c, d)[e + 2*f]),
        'ebufn*3':   comb(lambda a,b,c,d,e: (a, b, c, None)[d + 2*e]),
        'einvn*3':   comb(lambda a,b,c,d,e: (~a, ~b, ~c, None)[d + 2*e]),
        'dlxtp':     latch(invert_output=False, invert_data=False, has_reset=False, has_set=False),
        'dlxtp#i':   latch(invert_output=True,  invert_data=False, has_reset=False, has_set=False),
        'dlxtn':     latch(invert_output=False, invert_data=True,  has_reset=False, has_set=False),
        'dlxtn#i':   latch(invert_output=True,  invert_data=True,  has_reset=False, has_set=False),
        'dlrtp':     latch(invert_output=False, invert_data=False, has_reset=True,  has_set=False),
        'dlrtp#i':   latch(invert_output=True,  invert_data=False, has_reset=True,  has_set=False),
        'dlrtn':     latch(invert_output=False, invert_data=True,  has_reset=True,  has_set=False),
        'dlrtn#i':   latch(invert_output=True,  invert_data=True,  has_reset=True,  has_set=False),
        'dlstp':     latch(invert_output=False, invert_data=False, has_reset=False, has_set=True),
        'dlstp#i':   latch(invert_output=True,  invert_data=False, has_reset=False, has_set=True),
        'dlstn':     latch(invert_output=False, invert_data=True,  has_reset=False, has_set=True),
        'dlstn#i':   latch(invert_output=True,  invert_data=True,  has_reset=False, has_set=True),
        'dlbtp':     latch(invert_output=False, invert_data=False, has_reset=True,  has_set=True),
        'dlbtp#i':   latch(invert_output=True,  invert_data=False, has_reset=True,  has_set=True),
        'dlbtn':     latch(invert_output=False, invert_data=True,  has_reset=True,  has_set=True),
        'dlbtn#i':   latch(invert_output=True,  invert_data=True,  has_reset=True,  has_set=True),
        'dlclkp':    clock_gate(has_scanchain=False, invert_clock=False),
        'dlclkn':    clock_gate(has_scanchain=False, invert_clock=True),
        'sdlclkp':   clock_gate(has_scanchain=True,  invert_clock=False),
        'sdlclkn':   clock_gate(has_scanchain=True,  invert_clock=True),
        'dfxtp':     flop(invert_output=False, invert_clock=False, has_reset=False, has_set=False, has_loopback=False, has_scanchain=False),
        'dfxtp#i':   flop(invert_output=True , invert_clock=False, has_reset=False, has_set=False, has_loopback=False, has_scanchain=False),
        'dfxtn':     flop(invert_output=False, invert_clock=True,  has_reset=False, has_set=False, has_loopback=False, has_scanchain=False),
        'dfxtn#i':   flop(invert_output=True , invert_clock=True,  has_reset=False, has_set=False, has_loopback=False, has_scanchain=False),
        'dfrtp':     flop(invert_output=False, invert_clock=False, has_reset=True,  has_set=False, has_loopback=False, has_scanchain=False),
        'dfrtp#i':   flop(invert_output=True , invert_clock=False, has_reset=True,  has_set=False, has_loopback=False, has_scanchain=False),
        'dfrtn':     flop(invert_output=False, invert_clock=True,  has_reset=True,  has_set=False, has_loopback=False, has_scanchain=False),
        'dfrtn#i':   flop(invert_output=True , invert_clock=True,  has_reset=True,  has_set=False, has_loopback=False, has_scanchain=False),
        'dfstp':     flop(invert_output=False, invert_clock=False, has_reset=False, has_set=True,  has_loopback=False, has_scanchain=False),
        'dfstp#i':   flop(invert_output=True , invert_clock=False, has_reset=False, has_set=True,  has_loopback=False, has_scanchain=False),
        'dfstn':     flop(invert_output=False, invert_clock=True,  has_reset=False, has_set=True,  has_loopback=False, has_scanchain=False),
        'dfstn#i':   flop(invert_output=True , invert_clock=True,  has_reset=False, has_set=True,  has_loopback=False, has_scanchain=False),
        'dfbtp':     flop(invert_output=False, invert_clock=False, has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=False),
        'dfbtp#i':   flop(invert_output=True , invert_clock=False, has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=False),
        'dfbtn':     flop(invert_output=False, invert_clock=True,  has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=False),
        'dfbtn#i':   flop(invert_output=True , invert_clock=True,  has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=False),
        'edfxtp':    flop(invert_output=False, invert_clock=False, has_reset=False, has_set=False, has_loopback=True,  has_scanchain=False),
        'edfxtp#i':  flop(invert_output=True , invert_clock=False, has_reset=False, has_set=False, has_loopback=True,  has_scanchain=False),
        'sdfxtp':    flop(invert_output=False, invert_clock=False, has_reset=False, has_set=False, has_loopback=False, has_scanchain=True),
        'sdfxtp#i':  flop(invert_output=True , invert_clock=False, has_reset=False, has_set=False, has_loopback=False, has_scanchain=True),
        'sdfrtp':    flop(invert_output=False, invert_clock=False, has_reset=True,  has_set=False, has_loopback=False, has_scanchain=True),
        'sdfrtp#i':  flop(invert_output=True , invert_clock=False, has_reset=True,  has_set=False, has_loopback=False, has_scanchain=True),
        'sdfrtn':    flop(invert_output=False, invert_clock=True,  has_reset=True,  has_set=False, has_loopback=False, has_scanchain=True),
        'sdfrtn#i':  flop(invert_output=True , invert_clock=True,  has_reset=True,  has_set=False, has_loopback=False, has_scanchain=True),
        'sdfstp':    flop(invert_output=False, invert_clock=False, has_reset=False, has_set=True,  has_loopback=False, has_scanchain=True),
        'sdfstp#i':  flop(invert_output=True , invert_clock=False, has_reset=False, has_set=True,  has_loopback=False, has_scanchain=True),
        'sdfbtp':    flop(invert_output=False, invert_clock=False, has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=True),
        'sdfbtp#i':  flop(invert_output=True , invert_clock=False, has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=True),
        'sdfbtn#':   flop(invert_output=False, invert_clock=True,  has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=True),
        'sdfbtn#i':  flop(invert_output=True , invert_clock=True,  has_reset=True,  has_set=True,  has_loopback=False, has_scanchain=True),
        'sedfxtp':   flop(invert_output=False, invert_clock=False, has_reset=False, has_set=False, has_loopback=True,  has_scanchain=True),
        'sedfxtp#i': flop(invert_output=True , invert_clock=False, has_reset=False, has_set=False, has_loopback=True,  has_scanchain=True),
        '#tritest0': tristate(test_type=0),
        '#tritest1': tristate(test_type=1),
        '#tritest2': tristate(test_type=2),
    }

    for i in range(210):
        cell = pin_mapping[i]
        if cell in cell_mapping:
            cell = cell_mapping[cell]
        io_pairs, sequential = pin_tests[cell]
        lenient = sequential and not gatelevel
        await check_cell_pin(dut, i, io_pairs, lenient)

