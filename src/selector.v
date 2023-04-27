module selector (
    input [4:0] addr,
    input ena,
    input [31:0] idata1,
    input [31:0] idata2,
    input [31:0] idata3,
    input [31:0] idata4,
    input [31:0] idata5,
    input [31:0] idata6,
    input [31:0] idata7,
    input [31:0] idata8,
    input [31:0] idata9,
    input [31:0] idata10,
    input [31:0] idata11,
    input [31:0] idata12,
    input [31:0] idata13,
    input [31:0] idata14,
    input [31:0] idata15,
    input [31:0] idata16,
    input [31:0] idata17,
    input [31:0] idata18,
    input [31:0] idata19,
    input [31:0] idata20,
    input [31:0] idata21,
    input [31:0] idata22,
    input [31:0] idata23,
    input [31:0] idata24,
    input [31:0] idata25,
    input [31:0] idata26,
    input [31:0] idata27,
    input [31:0] idata28,
    input [31:0] idata29,
    input [31:0] idata30,
    input [31:0] idata31,
    input [31:0] idata32,
    output reg [31:0] odata
);
always@(*)
    begin
        if(ena==0)
        begin
            case (addr)
            5'b00000: odata=idata1;
            5'b00001: odata=idata2;
            5'b00010: odata=idata3;
            5'b00011: odata=idata4;
            5'b00100: odata=idata5;
            5'b00101: odata=idata6;
            5'b00110: odata=idata7;
            5'b00111: odata=idata8;
            5'b01000: odata=idata9;
            5'b01001: odata=idata10;
            5'b01010: odata=idata11;
            5'b01011: odata=idata12;
            5'b01100: odata=idata13;
            5'b01101: odata=idata14;
            5'b01110: odata=idata15;
            5'b01111: odata=idata16;
            5'b10000: odata=idata17;
            5'b10001: odata=idata18;
            5'b10010: odata=idata19;
            5'b10011: odata=idata20;
            5'b10100: odata=idata21;
            5'b10101: odata=idata22;
            5'b10110: odata=idata23;
            5'b10111: odata=idata24;
            5'b11000: odata=idata25;
            5'b11001: odata=idata26;
            5'b11010: odata=idata27;
            5'b11011: odata=idata28;
            5'b11100: odata=idata29;
            5'b11101: odata=idata30;
            5'b11110: odata=idata31;
            5'b11111: odata=idata32;
            default: odata=32'b0;
            
            endcase
        end
        else
            odata=32'bz;
    
    end

endmodule //selector