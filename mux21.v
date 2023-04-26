module mux21 (
    input [31:0] operand1,
    input [31:0] operand2,
    output [31:0] r,
    input select_signal
    
);
//this module serves versatile functions, we use it to get the operand_a and operand b for alu
assign r=select_signal? operand1:operand2;

endmodule //mux21