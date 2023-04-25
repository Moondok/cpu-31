`include "cpu.v"
`include "dmem.v"
`include "imem.v"
module sccomp_dataflow (
    input clk,
    input rstn
);

wire [31:0] instuction;
wire [31:0] w_data;
wire [31:0] r_data;

wire [10:0] data_addr; //for read and write can't be executed simultaneously ,so share a public addr
wire [10:0] instruction_addr;

wire dmem_w;
wire dmem_r;

cpu sccpu(.clk(clk),.rst(rstn),.instr(instuction),.r_data(r_data),.data_addr(data_addr),.w_data(w_data)
    ,.instr_addr(instruction_addr),.dmem_r(dmem_r),.dmem_w(dmem_w));

dmem dmem_inst(.dm_w(dmem_w),.dm_r(dmem_r),.dm_addr(data_addr),.dm_wdata(w_data),.dm_rdata(r_data));

imem imem_inst(.instr_addr(instruction_addr),.instr(instuction));

endmodule //sccomp_dataflow