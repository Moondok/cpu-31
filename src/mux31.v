module mux31 (
    input [31:0] dmem_value,
    input [31:0] alu_value,
    input [31:0] add2_value,
    input [1:0] select_signal,
    output reg [31:0] ref_wdata
);

// this module is to output the value write in regfile , we have 3 sources : dmem(lw), alu( most instruction),add2(jal)

always @(*) 
begin
    if(select_signal==2'b00)
        ref_wdata<=alu_value;
    else if(select_signal==2'b01)
        ref_wdata<=dmem_value;
    else if(select_signal==2'b10)
        ref_wdata<=add2_value;
end

endmodule //mux31