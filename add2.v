module add2 (
    input [31:0] pc_value,
    output [31:0] o_data  
);
// this module is to add Pc with a constant , to restore the old addr to register ra, this value will be passed to mux31
assign o_data=pc_value+8;

endmodule //add2