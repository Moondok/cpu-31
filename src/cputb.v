//`include "sccomp_dataflow.v"
module cputb ;
reg clk=1,rst=1;
wire [31:0] inst,pc; // for debug
integer file_open;

integer counter=0;

always 
begin
    # 20 clk=~clk;
end

initial 
begin
    file_open=$fopen("result_me.txt","w+");
    //$readmemh("h_1_addi.txt",uut.imem_inst.mem);

end

always @(negedge clk) 
begin
    counter<=counter+1;
    if (counter<=8'h99-1&&counter>=1'b0)
    begin
       // $fdisplay(file_output,"check memory: %h",uut.imem_inst.mem[0]);
        $fdisplay(file_open,"pc: %h",uut.instr_addr_read);
        $fdisplay(file_open, "instr: %h", uut.instruction);
        // $fdisplay(file_output,"cpu pc in: %h",uut.sccpu.pcreg_inst.data_in);
        // $fdisplay(file_output,"cpu pc out: %h",uut.sccpu.pcreg_inst.data_out);
        // $fdisplay(file_output,"npc in: %h",uut.sccpu.npc_inst.former_instr_addr);
        // $fdisplay(file_output,"npc out: %h",uut.sccpu.npc_inst.next_instr_addr);
        // $fdisplay(file_output,"mux41: %h",uut.sccpu.mux_41_inst.pc_value);
        // $fdisplay(file_output,"mux41 in: %h",uut.sccpu.mux_41_inst.npc_value);
        // $fdisplay(file_output,"mux41_signal: %h",uut.sccpu.mux_41_inst.select_signal);
        // $fdisplay(file_output,"controller input str: %h",uut.sccpu.controller_inst.decoded_instr);
        // $fdisplay(file_output,"controller input str: %h",uut.sccpu.decoded_instr);
        // $fdisplay(file_output,"decoded instr: %h",uut.sccpu.instrument_decoder_inst.code);
        // $fdisplay(file_output,"decoded raw instr: %h",uut.sccpu.instr);
        // $fdisplay(file_output,"decoded raw instr: %h",uut.sccpu.instrument_decoder_inst.raw_instruction);
        $fdisplay(file_open, "regfile0: %h", uut.sccpu.cpu_ref.array_reg[0]);
        $fdisplay(file_open, "regfile1: %h", uut.sccpu.cpu_ref.array_reg[1]);
        $fdisplay(file_open, "regfile2: %h", uut.sccpu.cpu_ref.array_reg[2]);
        $fdisplay(file_open, "regfile3: %h", uut.sccpu.cpu_ref.array_reg[3]);
        $fdisplay(file_open, "regfile4: %h", uut.sccpu.cpu_ref.array_reg[4]);
        $fdisplay(file_open, "regfile5: %h", uut.sccpu.cpu_ref.array_reg[5]);
        $fdisplay(file_open, "regfile6: %h", uut.sccpu.cpu_ref.array_reg[6]);
        $fdisplay(file_open, "regfile7: %h", uut.sccpu.cpu_ref.array_reg[7]);
        $fdisplay(file_open, "regfile8: %h", uut.sccpu.cpu_ref.array_reg[8]);
        $fdisplay(file_open, "regfile9: %h", uut.sccpu.cpu_ref.array_reg[9]);
        $fdisplay(file_open, "regfile10: %h", uut.sccpu.cpu_ref.array_reg[10]);
        $fdisplay(file_open, "regfile11: %h", uut.sccpu.cpu_ref.array_reg[11]);
        $fdisplay(file_open, "regfile12: %h", uut.sccpu.cpu_ref.array_reg[12]);
        $fdisplay(file_open, "regfile13: %h", uut.sccpu.cpu_ref.array_reg[13]);
        $fdisplay(file_open, "regfile14: %h", uut.sccpu.cpu_ref.array_reg[14]);
        $fdisplay(file_open, "regfile15: %h", uut.sccpu.cpu_ref.array_reg[15]);
        $fdisplay(file_open, "regfile16: %h", uut.sccpu.cpu_ref.array_reg[16]);
        $fdisplay(file_open, "regfile17: %h", uut.sccpu.cpu_ref.array_reg[17]);
        $fdisplay(file_open, "regfile18: %h", uut.sccpu.cpu_ref.array_reg[18]);
        $fdisplay(file_open, "regfile19: %h", uut.sccpu.cpu_ref.array_reg[19]);
        $fdisplay(file_open, "regfile20: %h", uut.sccpu.cpu_ref.array_reg[20]);
        $fdisplay(file_open, "regfile21: %h", uut.sccpu.cpu_ref.array_reg[21]);
        $fdisplay(file_open, "regfile22: %h", uut.sccpu.cpu_ref.array_reg[22]);
        $fdisplay(file_open, "regfile23: %h", uut.sccpu.cpu_ref.array_reg[23]);
        $fdisplay(file_open, "regfile24: %h", uut.sccpu.cpu_ref.array_reg[24]);
        $fdisplay(file_open, "regfile25: %h", uut.sccpu.cpu_ref.array_reg[25]);
        $fdisplay(file_open, "regfile26: %h", uut.sccpu.cpu_ref.array_reg[26]);
        $fdisplay(file_open, "regfile27: %h", uut.sccpu.cpu_ref.array_reg[27]);
        $fdisplay(file_open, "regfile28: %h", uut.sccpu.cpu_ref.array_reg[28]);
        $fdisplay(file_open, "regfile29: %h", uut.sccpu.cpu_ref.array_reg[29]);
        $fdisplay(file_open, "regfile30: %h", uut.sccpu.cpu_ref.array_reg[30]);
        $fdisplay(file_open, "regfile31: %h", uut.sccpu.cpu_ref.array_reg[31]);
    end
    else
        $fclose(file_open);

    
end

// initial
// begin
//     $dumpfile("cpu.vcd");
//     $dumpvars;

//     #2000;
//     $finish;
// end

sccomp_dataflow uut(.clk(clk),.rstn(1'b1),.instr_addr_read(pc),.instruction(inst));




endmodule //cputb