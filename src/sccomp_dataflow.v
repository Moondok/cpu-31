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

// get the data addr and instr addr from cpu module ,the perform mapping operation to them
wire [31:0] data_addr_read;
wire [31:0] instr_addr_read;

// input to imem and dmem
wire [10:0] data_addr; //for read and write can't be executed simultaneously ,so share a public addr
wire [10:0] instruction_addr;

// mapping operation
assign data_addr=(data_addr_read-32'h10010000)/4;
assign instr_addr=(instr_addr_read-32'h00400000)/4;

wire dmem_w;
wire dmem_r;


cpu sccpu(.clk(clk),.rst(rstn),.instr(instuction),.dmem_data(r_data),.data_addr(data_addr_read),.w_data(w_data)
    ,.instr_addr(instruction_addr_read),.dmem_r(dmem_r),.dmem_w(dmem_w));

dmem dmem_inst(.dm_w(dmem_w),.dm_r(dmem_r),.dm_addr(data_addr),.dm_wdata(w_data),.dm_rdata(r_data));

imem imem_inst(.instr_addr(instruction_addr),.instr(instuction));

endmodule //sccomp_dataflow