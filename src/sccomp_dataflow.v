// `include "dmem.v"
// `include "imem_module.v"
// `include "cpu.v"

module sccomp_dataflow (
    input clk, //posedge write regfile or dmem, negedge write pc
    input rstn, //0: reset   1: doing nothing

    output wire [31:0] instr_addr_read,
    
    output wire [31:0] instruction
);


wire [31:0] w_data;
wire [31:0] r_data;

// get the data addr and instr addr from cpu module ,the perform mapping operation to them
wire [31:0] data_addr_read;


// input to imem and dmem
wire [10:0] data_addr; //for read and write can't be executed simultaneously ,so share a public addr
wire [10:0] instruction_addr;

// mapping operation
assign data_addr=(data_addr_read-32'h10010000)/4;
assign instruction_addr=(instr_addr_read-32'h00400000)/4;

wire dmem_w;
wire dmem_r;

cpu sccpu(.clk(clk),.rst(rstn),.instr(instruction),.dmem_data(r_data),.data_addr(data_addr_read),.w_data(w_data),
    .instr_addr(instr_addr_read),.dmem_r(dmem_r),.dmem_w(dmem_w));

dmem dmem_inst(.clk(clk),.dm_w(dmem_w),.dm_r(dmem_r),.dm_addr(data_addr),.dm_wdata(w_data),.dm_rdata(r_data));

imem imem_inst(.a(instruction_addr),.spo(instruction));

endmodule //sccomp_dataflow