//`include "sccomp_dataflow.v"
module cputb ;
reg clk=0,rst=1;
wire [31:0] inst,pc; // for debug
integer file_open;

integer counter=0;

always 
begin
    # 2 clk=~clk;
end


initial 
begin
    # 2 rst=0;
end


initial 
begin
    file_open=$fopen("result_me.txt","w+");
end

always 
begin
    #2;
    if (clk==1'b1)
    begin
    counter<=counter+1;
    if (counter<=8'h99-1&&counter>=1'b0)
    begin
        $fdisplay(file_open,"pc: %h",uut.instr_addr_read);
        $fdisplay(file_open, "instr: %h", uut.instruction);
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
    begin
        $fclose(file_open);
    end
    end
    

    
end

// initial
// begin
//     $dumpfile("cpu.vcd");
//     $dumpvars;

//     #200;
//     $finish;
// end

sccomp_dataflow uut(.clk_in(clk),.reset(rst),.pc(pc),.inst(inst));




endmodule //cputb