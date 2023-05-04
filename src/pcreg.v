module pcreg (
    input clk,
    input ena,
    input rstn,
    input [31:0] data_in,
    output[31:0] data_out
);
reg [31:0] mem=32'h00400000;

always @(negedge clk or negedge rstn)
begin
   if(ena)
   begin
    if(!rstn)
        mem=32'h00400000;
    else
        mem=data_in;
   end
end

assign data_out= (ena&&rstn)? mem:32'h00400000;



endmodule //pcreg