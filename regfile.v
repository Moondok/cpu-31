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
wire [31:0] array[31:0];
decoder decoder_inst(.waddr(waddr),.we(we),.one_hot_waddr(decode_result));

pcreg  pcreg1(clk,decode_result[0],rst, wdata,array[0]);
pcreg  pcreg2(clk,decode_result[1],rst, wdata,array[1]);
pcreg  pcreg3(clk,decode_result[2],rst, wdata,array[2]);
pcreg  pcreg4(clk,decode_result[3],rst, wdata,array[3]);
pcreg  pcreg5(clk,decode_result[4],rst, wdata,array[4]);
pcreg  pcreg6(clk,decode_result[5],rst, wdata,array[5]);
pcreg  pcreg7(clk,decode_result[6],rst, wdata,array[6]);
pcreg  pcreg8(clk,decode_result[7],rst, wdata,array[7]);
pcreg  pcreg9(clk,decode_result[8],rst, wdata,array[8]);
pcreg  pcreg10(clk,decode_result[9],rst, wdata,array[9]);
pcreg  pcreg11(clk,decode_result[10],rst, wdata,array[10]);
pcreg  pcreg12(clk,decode_result[11],rst, wdata,array[11]);
pcreg  pcreg13(clk,decode_result[12],rst, wdata,array[12]);
pcreg  pcreg14(clk,decode_result[13],rst, wdata,array[13]);
pcreg  pcreg15(clk,decode_result[14],rst, wdata,array[14]);
pcreg  pcreg16(clk,decode_result[15],rst, wdata,array[15]);

pcreg  pcreg17(clk,decode_result[16],rst, wdata,array[16]);
pcreg  pcreg18(clk,decode_result[17],rst, wdata,array[17]);
pcreg  pcreg19(clk,decode_result[18],rst, wdata,array[18]);
pcreg  pcreg20(clk,decode_result[19],rst, wdata,array[19]);
pcreg  pcreg21(clk,decode_result[20],rst, wdata,array[20]);
pcreg  pcreg22(clk,decode_result[21],rst, wdata,array[21]);

pcreg  pcreg23(clk,decode_result[22],rst, wdata,array[22]);
pcreg  pcreg24(clk,decode_result[23],rst, wdata,array[23]);
pcreg  pcreg25(clk,decode_result[24],rst, wdata,array[24]);
pcreg  pcreg26(clk,decode_result[25],rst, wdata,array[25]);
pcreg  pcreg27(clk,decode_result[26],rst, wdata,array[26]);
pcreg  pcreg28(clk,decode_result[27],rst, wdata,array[27]);

pcreg  pcreg29(clk,decode_result[28],rst, wdata,array[28]);
pcreg  pcreg30(clk,decode_result[29],rst, wdata,array[29]);
pcreg  pcreg31(clk,decode_result[30],rst, wdata,array[30]);
pcreg  pcreg32(clk,decode_result[31],rst, wdata,array[31]);

selector seletor1(raddr1,we,
array[0],array[1],array[2],array[3],
array[4],array[5],array[6],array[7],
array[8],array[9],array[10],array[11],
array[12],array[13],array[14],array[15],
array[16],array[17],array[18],array[19],
array[20],array[21],array[22],array[23],
array[24],array[25],array[26],array[27],
array[28],array[29],array[30],array[31],rdata1);

selector seletor2(raddr2,we,
array[0],array[1],array[2],array[3],
array[4],array[5],array[6],array[7],
array[8],array[9],array[10],array[11],
array[12],array[13],array[14],array[15],
array[16],array[17],array[18],array[19],
array[20],array[21],array[22],array[23],
array[24],array[25],array[26],array[27],
array[28],array[29],array[30],array[31],rdata2);


endmodule //regfile