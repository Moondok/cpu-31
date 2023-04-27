module add1 (
    input [31:0] a,
    input [31:0] b,
    output [31:0] o_data,
    output overflow
);

// this module is to get the addr for PC, in instruction beq and bne
assign o_data=a+b;
assign overflow=(a[31]==b[31]&&a[31]!=o_data[31]);
endmodule //add1