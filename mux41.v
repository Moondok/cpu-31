module mux41 (
    input [31:0] npc_value,
    input [31:0] Rs_value,
    input [31:0] ADD1_value,
    input [31:0] joint_value,
    input [1:0] select_signal,
    output reg[31:0] pc_value

);
// this module output the PC value, select from 4 candidates:NPC Rs(j), ADD1(beq,bne),and ||(j,jal )
always @(*) 
begin
    if(select_signal==2'b00)
        pc_value<=npc_value;
    else if(select_signal==2'b01)
        pc_value<=Rs_value;
    else if (select_signal==2'b10)
        pc_value<=ADD1_value;
    else
        pc_value<=joint_value;
end



endmodule //mux41