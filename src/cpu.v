// `include "instruction_decoder.v"
// `include "ext18.v"
// `include "ex16.v"
// `include "ex5.v"
// `include "mux21.v"
// `include "mux21_1.v"
// `include "alu.v"
// `include "controller.v"
// `include "mux31.v"
// `include "mux31_1.v"
// `include "regfile.v"
// `include "joint.v"
// `include "npc.v"
// `include "mux41.v"
// `include "add1.v"
// `include "add2.v"
// `include "pcreg.v"

module cpu (
    input clk,
    input rst,
    input[31:0] instr,
    input[31:0] dmem_data,
    output[31:0] data_addr,
    output [31:0] instr_addr,
    output[31:0] w_data,
    output dmem_w,
    output dmem_r
);

// inner wires 
wire  [31:0] decoded_instr;

// operands and result for alu
wire [31:0] operand_a;
wire [31:0] operand_b;
wire [31:0] alu_result;

//input for ex5-32
wire [4:0] in_5;  //get from mux21_1

//result from ext5-32 and ext16-32
wire [31:0] r_5;
wire [31:0] r_16;

//output signal of alu
wire zero;
wire carry;
wire negative;
wire overflow;

//output signal of controller
wire regfile_w;
wire [3:0] alu_control;

//write addr for regfile
wire [4:0] ref_waddr;
// write data for regfile
wire [31:0] ref_wdata;

// read register Rs Rt from regfile
wire [31:0] Rs_value;
wire [31:0] Rt_value;

// the dataflow input pc
wire [31:0] in_pc;
wire [31:0] out_npc;
wire [31:0] out_joint;
wire [31:0] out_add1;
wire [31:0] out_add2;// pc+8 ,restore in ra register ,for instruction jal
wire [31:0] out_pc;// also as in_npc
wire [1:0] mux41_signal;

//dataflow for the ex5 output
wire mux21_1_signal;

//decide to do signed extend or zero-extend
wire extend16_signal;

//the result from ext18
wire [31:0] r_18;

// wire get the result from add1 to decide whether next addr of instruction has an overflow
wire overflow_signal;

// control signal for mux31_1 to get the signal for the write address of regfile
wire [1:0] ref_waddr_signal;

// control signal for mux31 to get the signal for the write data of regfile
wire [1:0] ref_wdata_signal;

// selection signal for alu operands
wire alu_operand1_signal;
wire alu_operand2_signal;

// signal to control dmem , get from controller
wire d_r;
wire d_w;

// signal from alu's zero , for the instriction beq and bne


//inner components

instrument_decoder instrument_decoder_inst(.raw_instruction(instr),.code(decoded_instr));

// extend imm||00 to 32 bits
ext18 ex18_inst(.imm({instr[15:0],2'b00}),.o(r_18));

ex16 ex16_inst(.in_data(instr[15:0]),.o_data(r_16),.signal(extend16_signal));

ex5 ex5_inst(.i_shift_num(in_5),.o_shift_num(r_5));

// get a correct input for ex5
mux21_1 mux21_1_inst(.imm_value(instr[10:6]),.Rs_value(instr[25:21]),.o_data(in_5),.signal(mux21_1_signal));

mux21 mux21_get_operanda(.operand1(r_5),.operand2(Rt_value),.r(operand_a),.select_signal(alu_operand1_signal));

mux21 mux21_get_operandb(.operand1(r_16),.operand2(Rs_value),.r(operand_b),.select_signal(alu_operand2_signal));

alu alu_inst(.a(operand_a),.b(operand_b),.r(alu_result),.zero(zero),.carry(carry),.negative(negative),.overflow(overflow),.aluc(alu_control));

controller controller_inst(.decoded_instr(decoded_instr),.dmem_r(dmem_r),.dmem_w(dmem_w),.regfile_w(regfile_w),.alu_control(alu_control),.mux41_signal(mux41_signal),
            .mux21_1_signal(mux21_1_signal),.extend16_signal(extend16_signal),.ref_waddr_signal(ref_waddr_signal),.ref_wdata_signal(ref_wdata_signal),
            .alu_operand1_signal(alu_operand1_signal),.alu_operand2_signal(alu_operand2_signal),.d_r(d_r),.d_w(d_w),.zero_signal(zero));

mux31 mux31_inst(.dmem_value(dmem_data),.alu_value(alu_result),.add2_value(out_add2),.select_signal(ref_wdata_signal),.ref_wdata(ref_wdata));

mux31_1 mux31_1_inst(.Rt(instr[20:16]),.Rd(instr[15:11]),.ref_waddr(ref_waddr),.select_signal(ref_waddr_signal));

// regfile and pcreg hold different clk 
regfile cpu_ref(.clk(~clk),.rst(rst),.we(regfile_w),.waddr(ref_waddr),.wdata(ref_wdata),.raddr1(instr[25:21]),.raddr2(instr[20:16]),.rdata1(Rs_value),.rdata2(Rt_value),.is_overflow(overflow));

pcreg pcreg_inst(.clk(clk),.ena(1'b1),.rstn(rst),.data_in(in_pc),.data_out(out_pc));

npc npc_inst(.former_instr_addr(out_pc),.next_instr_addr(out_npc));

//get the input for pc
mux41 mux_41_inst(.npc_value(out_npc),.Rs_value(Rs_value),.ADD1_value(out_add1),.joint_value(out_joint),.select_signal(mux41_signal),.pc_value(in_pc));

joint joint_inst(.pc_value(out_pc[31:28]),.jump_value({instr[25:0],2'b00}),.joint_addr(out_joint));

// add the result from ext18 and npc , then  pass the result to mux41 ( instruction beq and bne)
add1 add1_inst(.a(out_npc),.b(r_18),.o_data(out_add1),.overflow(overflow_signal));

add2 add2_inst(.pc_value(out_pc),.o_data(out_add2));


// external connections
assign data_addr=alu_result; // the data addr for dmem

assign w_data=Rt_value;

assign instr_addr=out_pc;

assign dmem_w=d_w;

assign dmem_r=d_r;


endmodule //cpu