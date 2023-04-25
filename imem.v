module imem (
    input [10:0] instr_addr,
    output [31:0] instr
    
);
reg [31:0] mem [31:0];
assign instr=mem[instr_addr];

endmodule //imem