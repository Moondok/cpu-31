module controller (
    input [31:0] decoded_instr,
    output dmem_r,
    output dmem_w,
    output regfile_w,
    output [3:0] alu_control,
    output [1:0] mux41_signal,
    output mux21_1_signal,
    output extend16_signal,
    output [1:0] ref_waddr_signal,
    output [1:0] ref_wdata_signal,
    output regfile_w,
    output alu_operand1_signal,
    output alu_operand2_signal,
    output d_r,
    output d_w
// );
);

assign  mux41_signal[0]=decoded_instr[16]||decoded_instr[29]||decoded_instr[30];//jr(Rs),j,jal(joint)
assign  mux41_signal[1]=decoded_instr[25]||decoded_instr[26]||decoded_instr[29]||decoded_instr[30];

assign mux21_1_signal=decoded_instr[10]||decoded_instr[11]||decoded_instr[12];
assign extend16_signal=decoded_instr[27]||decoded_instr[28]||decoded_instr[29];

assign ref_waddr_signal[0]=decoded_instr[17]||decoded_instr[18]||decoded_instr[19]||decoded_instr[20]||
        decoded_instr[21]||decoded_instr[22]||decoded_instr[23]||decoded_instr[27]||decoded_instr[28];

assign ref_waddr_signal[1]=decoded_instr[30];// jal

assign ref_wdata_signal[0]=decoded_instr[23];
assign ref_wdata_signal[1]=decoded_instr[30];

assign regfile_w=~(decoded_instr[16]||decoded_instr[24]||decoded_instr[25]||decoded_instr[26]||decoded_instr[29]);

assign alu_operand1_signal=decoded_instr[10]||decoded_instr[11]||decoded_instr[12]||decoded_instr[13]||decoded_instr[14]||decoded_instr[15];

assign alu_operand2_signal=decoded_instr[17]||decoded_instr[18]||decoded_instr[19]||decoded_instr[20]||decoded_instr[21]||decoded_instr[22]
                         ||decoded_instr[23]||decoded_instr[24]||decoded_instr[27]||decoded_instr[28];

assign d_r=decoded_instr[23];

assign d_w=decoded_instr[24];

endmodule //controller