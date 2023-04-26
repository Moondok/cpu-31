`include "instruction_decoder.v"
`include "controller.v"
`include "alu.v"
`include "dmem.v"
`include "regfile.v"
`include "mux31.v"
`include "mux31_1.v"
`include "mux21.v"

module cpu (
    input clk,
    input rst,
    input[31:0] instr,
    input[31:0] dmem_data,
    output[10:0] data_addr,
    output [10:0] instr_addr,
    output[31:0] w_data,
    output dmem_w,
    output dmem_r
);
wire  [31:0] decoded_instr;

// operands and result for alu
wire [31:0] operand_a;
wire [31:0] operand_b;
wire [31:0] alu_result;

//result from ext5-32 and ext16-32
wire [31:0] r_5;
wire [31:0] r_16;

//output signal of alu
wire zero;
wire carry;
wire negative;
wire overflow;

//output signal of controller
wire dmem_r;
wire dmem_w;
wire regfile_w;
wire [3:0] alu_control;

//write addr for regfile
wire [4:0] ref_waddr;
// write data for regfile
wire [31:0] ref_wdata;

// read register Rs Rt from regfile
wire [31:0] Rs_value;
wire [31:0] Rt_value;

instrument_decoder instrument_decoder_inst(.raw_instruction(instr),.code(decoded_instr));

mux21 mux21_get_operanda(.operand1(r_5),.operand2(Rt_value),.r(operand_a),.select_signal(1'b0));

mux21 mux21_get_operandb(.operand1(r_16),.operand2(Rs_value),.r(operand_b),.select_signal(1'b0));

alu alu_inst(.a(operand_a),.b(operand_b),.r(alu_result),.zero(zero),.carry(carry),.negative(negative),.overflow(overflow),.aluc(alu_control));

controller controller_inst(.decoded_instr(decoded_instr),.dmem_r(dmem_r),.dmem_w(dmem_w),.regfile_w(regfile_w),.alu_control(alu_control));

mux31 mux31_inst(.dmem_value(dmem_data),.alu_value(alu_result),.add2_value(0),.select_signal(2'b00),.ref_wdata(ref_wdata));

mux31_1 mux31_1_inst(.Rt(instr[20:16]),.Rd(instr[15:11]),.ref_waddr(ref_waddr),.select_signal(2'b01));

regfile cpu_ref(.clk(clk),.rst(rst),.we(regfile_w),.waddr(ref_waddr),.wdata(ref_wdata),.raddr1(instr[25:21]),.raddr2(instr[20:16]),.rdata1(Rs_value),.rdata2(Rt_value));




endmodule //cpu