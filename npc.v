module npc (
    input [31:0] former_instr_addr,
    output [31:0] next_instr_addr
);
assign next_instr_addr=former_instr_addr+4;

endmodule //npc