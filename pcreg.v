module pcreg (
    input clk,
    input ena,
    input rstn,
    input [31:0] data_in,
    output[31:0] data_out
);
reg [31:0] register=0;

always @(posedge clk or negedge rstn) 
begin
   if(ena)
   begin
    if(!rstn)
        register<=32'h00400000;
    else
        register<=data_in;
   end
end

assign data_out=(ena&&rstn)? register:32'h00400000;



endmodule //pcreg