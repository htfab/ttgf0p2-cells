`default_nettype none

module combined_cells (
    input tristate_gate,
    input [5:0] in,
    output [209:0] out
);

// constants
/////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__tieh tieh_inst_notouch_(.Z(out[0]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__tiel tiel_inst_notouch_(.ZN(out[1]));

// buffers & inverters
///////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_1 buf_1_inst_notouch_(.I(in[0]), .Z(out[2]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_2 buf_2_inst_notouch_(.I(in[0]), .Z(out[3]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_3 buf_3_inst_notouch_(.I(in[0]), .Z(out[4]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_4 buf_4_inst_notouch_(.I(in[0]), .Z(out[5]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_8 buf_8_inst_notouch_(.I(in[0]), .Z(out[6]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_12 buf_12_inst_notouch_(.I(in[0]), .Z(out[7]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_16 buf_16_inst_notouch_(.I(in[0]), .Z(out[8]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__buf_20 buf_20_inst_notouch_(.I(in[0]), .Z(out[9]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_1 inv_1_inst_notouch_(.I(in[0]), .ZN(out[10]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_2 inv_2_inst_notouch_(.I(in[0]), .ZN(out[11]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_3 inv_3_inst_notouch_(.I(in[0]), .ZN(out[12]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_4 inv_4_inst_notouch_(.I(in[0]), .ZN(out[13]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_8 inv_8_inst_notouch_(.I(in[0]), .ZN(out[14]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_12 inv_12_inst_notouch_(.I(in[0]), .ZN(out[15]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_16 inv_16_inst_notouch_(.I(in[0]), .ZN(out[16]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__inv_20 inv_20_inst_notouch_(.I(in[0]), .ZN(out[17]));

// and & nand variants
///////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and2_1 and2_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[18]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and2_2 and2_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[19]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and2_4 and2_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[20]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and3_1 and3_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[21]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and3_2 and3_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[22]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and3_4 and3_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[23]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and4_1 and4_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .Z(out[24]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and4_2 and4_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .Z(out[25]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__and4_4 and4_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .Z(out[26]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand2_1 nand2_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[27]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand2_2 nand2_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[28]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand2_4 nand2_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[29]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand3_1 nand3_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[30]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand3_2 nand3_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[31]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand3_4 nand3_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[32]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand4_1 nand4_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .ZN(out[33]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand4_2 nand4_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .ZN(out[34]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nand4_4 nand4_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .ZN(out[35]));

// or & nor variants
/////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or2_1 or2_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[36]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or2_2 or2_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[37]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or2_4 or2_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[38]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or3_1 or3_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[39]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or3_2 or3_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[40]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or3_4 or3_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[41]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or4_1 or4_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .Z(out[42]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or4_2 or4_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .Z(out[43]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__or4_4 or4_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .Z(out[44]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor2_1 nor2_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[45]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor2_2 nor2_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[46]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor2_4 nor2_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[47]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor3_1 nor3_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[48]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor3_2 nor3_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[49]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor3_4 nor3_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[50]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor4_1 nor4_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .ZN(out[51]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor4_2 nor4_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .ZN(out[52]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__nor4_4 nor4_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .A4(in[3]), .ZN(out[53]));

// xor & xnor variants
///////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xor2_1 xor2_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[54]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xor2_2 xor2_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[55]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xor2_4 xor2_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .Z(out[56]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xor3_1 xor3_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[57]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xor3_2 xor3_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[58]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xor3_4 xor3_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .Z(out[59]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xnor2_1 xnor2_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[60]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xnor2_2 xnor2_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[61]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xnor2_4 xnor2_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .ZN(out[62]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xnor3_1 xnor3_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[63]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xnor3_2 xnor3_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[64]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__xnor3_4 xnor3_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .ZN(out[65]));

// and-into-or variants
////////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi21_1 aoi21_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .ZN(out[66]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi21_2 aoi21_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .ZN(out[67]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi21_4 aoi21_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .ZN(out[68]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi22_1 aoi22_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .ZN(out[69]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi22_2 aoi22_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .ZN(out[70]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi22_4 aoi22_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .ZN(out[71]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi211_1 aoi211_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .C(in[3]), .ZN(out[72]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi211_2 aoi211_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .C(in[3]), .ZN(out[73]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi211_4 aoi211_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .C(in[3]), .ZN(out[74]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi221_1 aoi221_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C(in[4]), .ZN(out[75]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi221_2 aoi221_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C(in[4]), .ZN(out[76]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi221_4 aoi221_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C(in[4]), .ZN(out[77]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi222_1 aoi222_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C1(in[4]), .C2(in[5]), .ZN(out[78]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi222_2 aoi222_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C1(in[4]), .C2(in[5]), .ZN(out[79]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__aoi222_4 aoi222_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C1(in[4]), .C2(in[5]), .ZN(out[80]));

// or-into-and variants
////////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai21_1 oai21_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .ZN(out[81]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai21_2 oai21_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .ZN(out[82]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai21_4 oai21_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .ZN(out[83]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai22_1 oai22_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .ZN(out[84]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai22_2 oai22_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .ZN(out[85]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai22_4 oai22_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .ZN(out[86]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai31_1 oai31_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B(in[3]), .ZN(out[87]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai31_2 oai31_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B(in[3]), .ZN(out[88]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai31_4 oai31_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B(in[3]), .ZN(out[89]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai32_1 oai32_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B1(in[3]), .B2(in[4]), .ZN(out[90]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai32_2 oai32_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B1(in[3]), .B2(in[4]), .ZN(out[91]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai32_4 oai32_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B1(in[3]), .B2(in[4]), .ZN(out[92]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai33_1 oai33_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B1(in[3]), .B2(in[4]), .B3(in[5]), .ZN(out[93]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai33_2 oai33_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B1(in[3]), .B2(in[4]), .B3(in[5]), .ZN(out[94]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai33_4 oai33_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .A3(in[2]), .B1(in[3]), .B2(in[4]), .B3(in[5]), .ZN(out[95]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai211_1 oai211_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .C(in[3]), .ZN(out[96]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai211_2 oai211_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .C(in[3]), .ZN(out[97]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai211_4 oai211_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B(in[2]), .C(in[3]), .ZN(out[98]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai221_1 oai221_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C(in[4]), .ZN(out[99]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai221_2 oai221_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C(in[4]), .ZN(out[100]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai221_4 oai221_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C(in[4]), .ZN(out[101]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai222_1 oai222_1_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C1(in[4]), .C2(in[5]), .ZN(out[102]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai222_2 oai222_2_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C1(in[4]), .C2(in[5]), .ZN(out[103]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__oai222_4 oai222_4_inst_notouch_(.A1(in[0]), .A2(in[1]), .B1(in[2]), .B2(in[3]), .C1(in[4]), .C2(in[5]), .ZN(out[104]));

// other combinational cells (majority, multiplexors, adders)
//////////////////////////////////////////////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__addh_1 addh_1_inst_notouch_(.A(in[0]), .B(in[1]), .CO(out[105]), .S(out[106]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__addh_2 addh_2_inst_notouch_(.A(in[0]), .B(in[1]), .CO(out[107]), .S(out[108]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__addh_4 addh_4_inst_notouch_(.A(in[0]), .B(in[1]), .CO(out[109]), .S(out[110]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__addf_1 addf_1_inst_notouch_(.A(in[0]), .B(in[1]), .CI(in[2]), .CO(out[111]), .S(out[112]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__addf_2 addf_2_inst_notouch_(.A(in[0]), .B(in[1]), .CI(in[2]), .CO(out[113]), .S(out[114]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__addf_4 addf_4_inst_notouch_(.A(in[0]), .B(in[1]), .CI(in[2]), .CO(out[115]), .S(out[116]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__mux2_1 mux2_1_inst_notouch_(.I0(in[0]), .I1(in[1]), .S(in[2]), .Z(out[117]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__mux2_2 mux2_2_inst_notouch_(.I0(in[0]), .I1(in[1]), .S(in[2]), .Z(out[118]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__mux2_4 mux2_4_inst_notouch_(.I0(in[0]), .I1(in[1]), .S(in[2]), .Z(out[119]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__mux4_1 mux4_1_inst_notouch_(.I0(in[0]), .I1(in[1]), .I2(in[2]), .I3(in[3]), .S0(in[4]), .S1(in[5]), .Z(out[120]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__mux4_2 mux4_2_inst_notouch_(.I0(in[0]), .I1(in[1]), .I2(in[2]), .I3(in[3]), .S0(in[4]), .S1(in[5]), .Z(out[121]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__mux4_4 mux4_4_inst_notouch_(.I0(in[0]), .I1(in[1]), .I2(in[2]), .I3(in[3]), .S0(in[4]), .S1(in[5]), .Z(out[122]));

// latches
///////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latq_1 latq_1_inst_notouch_(.D(in[0]), .E(in[1]), .Q(out[123]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latq_2 latq_2_inst_notouch_(.D(in[0]), .E(in[1]), .Q(out[124]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latq_4 latq_4_inst_notouch_(.D(in[0]), .E(in[1]), .Q(out[125]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latrnq_1 latrnq_1_inst_notouch_(.D(in[0]), .E(in[1]), .RN(in[2]), .Q(out[126]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latrnq_2 latrnq_2_inst_notouch_(.D(in[0]), .E(in[1]), .RN(in[2]), .Q(out[127]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latrnq_4 latrnq_4_inst_notouch_(.D(in[0]), .E(in[1]), .RN(in[2]), .Q(out[128]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latsnq_1 latsnq_1_inst_notouch_(.D(in[0]), .E(in[1]), .SETN(in[2]), .Q(out[129]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latsnq_2 latsnq_2_inst_notouch_(.D(in[0]), .E(in[1]), .SETN(in[2]), .Q(out[130]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latsnq_4 latsnq_4_inst_notouch_(.D(in[0]), .E(in[1]), .SETN(in[2]), .Q(out[131]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latrsnq_1 latrsnq_1_inst_notouch_(.D(in[0]), .E(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[132]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latrsnq_2 latrsnq_2_inst_notouch_(.D(in[0]), .E(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[133]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__latrsnq_4 latrsnq_4_inst_notouch_(.D(in[0]), .E(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[134]));

// flops
/////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffq_1 dffq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .Q(out[135]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffq_2 dffq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .Q(out[136]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffq_4 dffq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .Q(out[137]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 dffrnq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .Q(out[138]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffrnq_2 dffrnq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .Q(out[139]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffrnq_4 dffrnq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .Q(out[140]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 dffsnq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .SETN(in[2]), .Q(out[141]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffsnq_2 dffsnq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .SETN(in[2]), .Q(out[142]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffsnq_4 dffsnq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .SETN(in[2]), .Q(out[143]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1 dffrsnq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[144]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffrsnq_2 dffrsnq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[145]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffrsnq_4 dffrsnq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[146]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnq_1 dffnq_1_inst_notouch_(.CLKN(in[0]), .D(in[1]), .Q(out[147]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnq_2 dffnq_2_inst_notouch_(.CLKN(in[0]), .D(in[1]), .Q(out[148]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnq_4 dffnq_4_inst_notouch_(.CLKN(in[0]), .D(in[1]), .Q(out[149]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1 dffnrnq_1_inst_notouch_(.CLKN(in[0]), .D(in[1]), .RN(in[2]), .Q(out[150]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnrnq_2 dffnrnq_2_inst_notouch_(.CLKN(in[0]), .D(in[1]), .RN(in[2]), .Q(out[151]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnrnq_4 dffnrnq_4_inst_notouch_(.CLKN(in[0]), .D(in[1]), .RN(in[2]), .Q(out[152]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1 dffnsnq_1_inst_notouch_(.CLKN(in[0]), .D(in[1]), .SETN(in[2]), .Q(out[153]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnsnq_2 dffnsnq_2_inst_notouch_(.CLKN(in[0]), .D(in[1]), .SETN(in[2]), .Q(out[154]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnsnq_4 dffnsnq_4_inst_notouch_(.CLKN(in[0]), .D(in[1]), .SETN(in[2]), .Q(out[155]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1 dffnrsnq_1_inst_notouch_(.CLKN(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[156]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_2 dffnrsnq_2_inst_notouch_(.CLKN(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[157]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_4 dffnrsnq_4_inst_notouch_(.CLKN(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .Q(out[158]));

// flops with scan chain
/////////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffq_1 sdffq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .SI(in[2]), .SE(in[3]), .Q(out[159]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffq_2 sdffq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .SI(in[2]), .SE(in[3]), .Q(out[160]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffq_4 sdffq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .SI(in[2]), .SE(in[3]), .Q(out[161]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffrnq_1 sdffrnq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SI(in[3]), .SE(in[4]), .Q(out[162]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffrnq_2 sdffrnq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SI(in[3]), .SE(in[4]), .Q(out[163]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffrnq_4 sdffrnq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SI(in[3]), .SE(in[4]), .Q(out[164]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffsnq_1 sdffsnq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .SETN(in[2]), .SI(in[3]), .SE(in[4]), .Q(out[165]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffsnq_2 sdffsnq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .SETN(in[2]), .SI(in[3]), .SE(in[4]), .Q(out[166]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffsnq_4 sdffsnq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .SETN(in[2]), .SI(in[3]), .SE(in[4]), .Q(out[167]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_1 sdffrsnq_1_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .SI(in[4]), .SE(in[5]), .Q(out[168]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_2 sdffrsnq_2_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .SI(in[4]), .SE(in[5]), .Q(out[169]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_4 sdffrsnq_4_inst_notouch_(.CLK(in[0]), .D(in[1]), .RN(in[2]), .SETN(in[3]), .SI(in[4]), .SE(in[5]), .Q(out[170]));

// tri-state buffers
/////////////////////
wire [5:0] gated_in = in & {6{tristate_gate}};
tri [4:0] tribuf;
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_1 bufz_1_inst_notouch_(.EN(gated_in[0]), .I(in[1]), .Z(tribuf[0]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_2 bufz_2_inst_notouch_(.EN(gated_in[2]), .I(in[3]), .Z(tribuf[0]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_3 bufz_3_inst_notouch_(.EN(gated_in[4]), .I(in[5]), .Z(tribuf[0]));
assign out[171] = tribuf[0];
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_4 bufz_4_inst_notouch_(.EN(gated_in[0]), .I(in[1]), .Z(tribuf[1]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_8 bufz_8_inst_notouch_(.EN(gated_in[2]), .I(in[3]), .Z(tribuf[1]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_12 bufz_12_inst_notouch_(.EN(gated_in[4]), .I(in[5]), .Z(tribuf[1]));
assign out[172] = tribuf[1];
(* keep *) gf180mcu_fd_sc_mcu7t5v0__bufz_16 bufz_16_inst_notouch_(.EN(gated_in[0]), .I(in[1]), .Z(tribuf[2]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__hold hold_inst_notouch_(.Z(tribuf[2]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_1 invz_1_inst_notouch_(.EN(gated_in[2]), .I(in[3]), .ZN(tribuf[2]));
assign out[173] = tribuf[2];
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_2 invz_2_inst_notouch_(.EN(gated_in[0]), .I(in[1]), .ZN(tribuf[3]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_3 invz_3_inst_notouch_(.EN(gated_in[2]), .I(in[3]), .ZN(tribuf[3]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_4 invz_4_inst_notouch_(.EN(gated_in[4]), .I(in[5]), .ZN(tribuf[3]));
assign out[174] = tribuf[3];
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_8 invz_8_inst_notouch_(.EN(gated_in[0]), .I(in[1]), .ZN(tribuf[4]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_12 invz_12_inst_notouch_(.EN(gated_in[2]), .I(in[3]), .ZN(tribuf[4]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__invz_16 invz_16_inst_notouch_(.EN(gated_in[4]), .I(in[5]), .ZN(tribuf[4]));
assign out[175] = tribuf[4];

// delay buffers
/////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlya_1 dlya_1_inst_notouch_(.I(in[0]), .Z(out[176]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlya_2 dlya_2_inst_notouch_(.I(in[0]), .Z(out[177]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlya_4 dlya_4_inst_notouch_(.I(in[0]), .Z(out[178]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyb_1 dlyb_1_inst_notouch_(.I(in[0]), .Z(out[179]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyb_2 dlyb_2_inst_notouch_(.I(in[0]), .Z(out[180]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyb_4 dlyb_4_inst_notouch_(.I(in[0]), .Z(out[181]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyc_1 dlyc_1_inst_notouch_(.I(in[0]), .Z(out[182]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyc_2 dlyc_2_inst_notouch_(.I(in[0]), .Z(out[183]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyc_4 dlyc_4_inst_notouch_(.I(in[0]), .Z(out[184]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyd_1 dlyd_1_inst_notouch_(.I(in[0]), .Z(out[185]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyd_2 dlyd_2_inst_notouch_(.I(in[0]), .Z(out[186]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__dlyd_4 dlyd_4_inst_notouch_(.I(in[0]), .Z(out[187]));

// buffers, inverters and delay buffers for the clock tree
///////////////////////////////////////////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 clkbuf_1_inst_notouch_(.I(in[0]), .Z(out[188]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkbuf_2_inst_notouch_(.I(in[0]), .Z(out[189]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 clkbuf_3_inst_notouch_(.I(in[0]), .Z(out[190]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_4 clkbuf_4_inst_notouch_(.I(in[0]), .Z(out[191]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_8 clkbuf_8_inst_notouch_(.I(in[0]), .Z(out[192]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_12 clkbuf_12_inst_notouch_(.I(in[0]), .Z(out[193]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_16 clkbuf_16_inst_notouch_(.I(in[0]), .Z(out[194]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkbuf_20 clkbuf_20_inst_notouch_(.I(in[0]), .Z(out[195]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_1 clkinv_1_inst_notouch_(.I(in[0]), .ZN(out[196]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkinv_2_inst_notouch_(.I(in[0]), .ZN(out[197]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_3 clkinv_3_inst_notouch_(.I(in[0]), .ZN(out[198]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_4 clkinv_4_inst_notouch_(.I(in[0]), .ZN(out[199]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_8 clkinv_8_inst_notouch_(.I(in[0]), .ZN(out[200]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_12 clkinv_12_inst_notouch_(.I(in[0]), .ZN(out[201]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_16 clkinv_16_inst_notouch_(.I(in[0]), .ZN(out[202]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__clkinv_20 clkinv_20_inst_notouch_(.I(in[0]), .ZN(out[203]));

// clock gating (latches for the clock tree)
/////////////////////////////////////////////
(* keep *) gf180mcu_fd_sc_mcu7t5v0__icgtp_1 icgtp_1_inst_notouch_(.CLK(in[0]), .E(in[1]), .TE(in[2]), .Q(out[204]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__icgtp_2 icgtp_2_inst_notouch_(.CLK(in[0]), .E(in[1]), .TE(in[2]), .Q(out[205]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__icgtp_4 icgtp_4_inst_notouch_(.CLK(in[0]), .E(in[1]), .TE(in[2]), .Q(out[206]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__icgtn_1 icgtn_1_inst_notouch_(.CLKN(in[0]), .E(in[1]), .TE(in[2]), .Q(out[207]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__icgtn_2 icgtn_2_inst_notouch_(.CLKN(in[0]), .E(in[1]), .TE(in[2]), .Q(out[208]));
(* keep *) gf180mcu_fd_sc_mcu7t5v0__icgtn_4 icgtn_4_inst_notouch_(.CLKN(in[0]), .E(in[1]), .TE(in[2]), .Q(out[209]));

// fill cells
//////////////
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_1 fill_1_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_2 fill_2_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_4 fill_4_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_8 fill_8_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_16 fill_16_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_32 fill_32_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fill_64 fill_64_inst_notouch_();

// fill cells with decoupling capacitors
/////////////////////////////////////////
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__endcap endcap_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fillcap_4 fillcap_4_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fillcap_8 fillcap_8_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fillcap_16 fillcap_16_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fillcap_32 fillcap_32_inst_notouch_();
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__fillcap_64 fillcap_64_inst_notouch_();

// tap cells
/////////////
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__filltie filltie_inst_notouch_();

// antenna tie-down diode
//////////////////////////
//(* keep *) gf180mcu_fd_sc_mcu7t5v0__antenna antenna_inst_notouch_(.I(in[0]));

endmodule

