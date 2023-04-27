`include "pcreg.v"
`include "decoder.v"
`include "selector.v"


module regfile (
    input clk,
    input rst,
    input we,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    output [31:0] rdata1,
    output [31:0] rdata2,
    input [31:0] wdata  
);

wire [31:0] decode_result;
wire [31:0] array_reg[31:0];
decoder decoder_inst(.waddr(waddr),.we(we),.one_hot_waddr(decode_result));

pcreg  pcreg1(clk,decode_result[0],rst, wdata,array_reg[0]);
pcreg  pcreg2(clk,decode_result[1],rst, wdata,array_reg[1]);
pcreg  pcreg3(clk,decode_result[2],rst, wdata,array_reg[2]);
pcreg  pcreg4(clk,decode_result[3],rst, wdata,array_reg[3]);
pcreg  pcreg5(clk,decode_result[4],rst, wdata,array_reg[4]);
pcreg  pcreg6(clk,decode_result[5],rst, wdata,array_reg[5]);
pcreg  pcreg7(clk,decode_result[6],rst, wdata,array_reg[6]);
pcreg  pcreg8(clk,decode_result[7],rst, wdata,array_reg[7]);
pcreg  pcreg9(clk,decode_result[8],rst, wdata,array_reg[8]);
pcreg  pcreg10(clk,decode_result[9],rst, wdata,array_reg[9]);
pcreg  pcreg11(clk,decode_result[10],rst, wdata,array_reg[10]);
pcreg  pcreg12(clk,decode_result[11],rst, wdata,array_reg[11]);
pcreg  pcreg13(clk,decode_result[12],rst, wdata,array_reg[12]);
pcreg  pcreg14(clk,decode_result[13],rst, wdata,array_reg[13]);
pcreg  pcreg15(clk,decode_result[14],rst, wdata,array_reg[14]);
pcreg  pcreg16(clk,decode_result[15],rst, wdata,array_reg[15]);

pcreg  pcreg17(clk,decode_result[16],rst, wdata,array_reg[16]);
pcreg  pcreg18(clk,decode_result[17],rst, wdata,array_reg[17]);
pcreg  pcreg19(clk,decode_result[18],rst, wdata,array_reg[18]);
pcreg  pcreg20(clk,decode_result[19],rst, wdata,array_reg[19]);
pcreg  pcreg21(clk,decode_result[20],rst, wdata,array_reg[20]);
pcreg  pcreg22(clk,decode_result[21],rst, wdata,array_reg[21]);

pcreg  pcreg23(clk,decode_result[22],rst, wdata,array_reg[22]);
pcreg  pcreg24(clk,decode_result[23],rst, wdata,array_reg[23]);
pcreg  pcreg25(clk,decode_result[24],rst, wdata,array_reg[24]);
pcreg  pcreg26(clk,decode_result[25],rst, wdata,array_reg[25]);
pcreg  pcreg27(clk,decode_result[26],rst, wdata,array_reg[26]);
pcreg  pcreg28(clk,decode_result[27],rst, wdata,array_reg[27]);

pcreg  pcreg29(clk,decode_result[28],rst, wdata,array_reg[28]);
pcreg  pcreg30(clk,decode_result[29],rst, wdata,array_reg[29]);
pcreg  pcreg31(clk,decode_result[30],rst, wdata,array_reg[30]);
pcreg  pcreg32(clk,decode_result[31],rst, wdata,array_reg[31]);

selector seletor1(raddr1,we,
array_reg[0],array_reg[1],array_reg[2],array_reg[3],
array_reg[4],array_reg[5],array_reg[6],array_reg[7],
array_reg[8],array_reg[9],array_reg[10],array_reg[11],
array_reg[12],array_reg[13],array_reg[14],array_reg[15],
array_reg[16],array_reg[17],array_reg[18],array_reg[19],
array_reg[20],array_reg[21],array_reg[22],array_reg[23],
array_reg[24],array_reg[25],array_reg[26],array_reg[27],
array_reg[28],array_reg[29],array_reg[30],array_reg[31],rdata1);

selector seletor2(raddr2,we,
array_reg[0],array_reg[1],array_reg[2],array_reg[3],
array_reg[4],array_reg[5],array_reg[6],array_reg[7],
array_reg[8],array_reg[9],array_reg[10],array_reg[11],
array_reg[12],array_reg[13],array_reg[14],array_reg[15],
array_reg[16],array_reg[17],array_reg[18],array_reg[19],
array_reg[20],array_reg[21],array_reg[22],array_reg[23],
array_reg[24],array_reg[25],array_reg[26],array_reg[27],
array_reg[28],array_reg[29],array_reg[30],array_reg[31],rdata2);


endmodule //regfile