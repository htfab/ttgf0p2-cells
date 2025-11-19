`default_nettype none

module cell_mux (
    input tristate_gate,
    input [4:0] page,
    input [5:0] in,
    output [7:0] out
);

wire [209:0] cc_out;

combined_cells cc_inst (
    .tristate_gate(tristate_gate && (page == 21)),
    .in(in),
    .out(cc_out)
);

assign out = cc_out[8*page +: 8];

endmodule

