module pcreg (
    input clk,
    input rstn,
    input ena,
    input [31:0] data_in,
    output reg [31:0] data_out
);

always @(posedge clk or negedge rstn) 
begin
    if(rstn==1'b0)
        data_out<=32'b0;
    else if(ena==1'b1)
        data_out<=data_in;
end

endmodule //pcreg