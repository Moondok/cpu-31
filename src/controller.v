module controller (
    input [31:0] decoded_instr,
    input zero_signal, // for beq and bne
    output dmem_r,
    output dmem_w,
    output regfile_w,
    output [3:0] alu_control,
    output [1:0] mux41_signal,
    output mux21_1_signal,
    output extend16_signal,
    output [1:0] ref_waddr_signal,
    output [1:0] ref_wdata_signal,
    output alu_operand1_signal,
    output alu_operand2_signal,
    output d_r,
    output d_w
// );
);

assign  mux41_signal[0]=decoded_instr[16]||decoded_instr[29]||decoded_instr[30];//jr(Rs),j,jal(joint)
assign  mux41_signal[1]=(decoded_instr[25]&&zero_signal)||(decoded_instr[26]&&~zero_signal)||decoded_instr[29]||decoded_instr[30];

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

assign alu_control[0]=decoded_instr[1]||decoded_instr[3]||decoded_instr[5]||decoded_instr[7]||decoded_instr[9]||decoded_instr[11]||decoded_instr[14]||decoded_instr[18]||decoded_instr[20]||decoded_instr[22]||decoded_instr[25]||decoded_instr[26]||decoded_instr[28];
assign alu_control[1]=decoded_instr[2]||decoded_instr[3]||decoded_instr[6]||decoded_instr[7]||decoded_instr[10]||decoded_instr[11]||decoded_instr[13]||decoded_instr[14]||decoded_instr[21]||decoded_instr[25]||decoded_instr[26];
assign alu_control[2]=decoded_instr[4]||decoded_instr[5]||decoded_instr[6]||decoded_instr[7]||decoded_instr[12]||decoded_instr[15]||decoded_instr[19]||decoded_instr[20]||decoded_instr[21]||decoded_instr[22];
assign alu_control[3]=decoded_instr[8]||decoded_instr[9]||decoded_instr[10]||decoded_instr[11]||decoded_instr[12]||decoded_instr[13]||decoded_instr[14]||decoded_instr[15]||decoded_instr[22]||decoded_instr[27]||decoded_instr[28];

endmodule //controller