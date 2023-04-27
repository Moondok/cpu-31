module mux21_1 (
    input [4:0] imm_value,
    input [4:0] Rs_value,
    input signal,
    output [4:0] o_data
    
);
// this module is to get a correct input for ex5
assign o_data=signal?imm_value:Rs_value;

endmodule //mux21_1