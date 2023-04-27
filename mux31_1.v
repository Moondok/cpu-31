module mux31_1 (
    input [4:0] Rt,
    input [4:0] Rd,
    input [1:0] select_signal,
    output reg[4:0] ref_waddr
);
// this module is to select a write addr for regfile ,3 candidates are Rd( most r instr), Rt (most i instr) and ra(jal)
localparam ra=5'b11111; // ra register, just for jal instruction


always @(*) 
begin
    if(select_signal==2'b00)
        ref_waddr<=Rd;
    else if(select_signal==2'b01)
        ref_waddr<=Rt;
    else if(select_signal==2'b10)
        ref_waddr<=ra;
end

endmodule //mux31_1