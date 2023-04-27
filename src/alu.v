module alu (
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg[31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
);
always @(*)
    begin
        casez(aluc)
        
        //algorithm 
          4'b0000:
          begin
          {carry,r}=a+b;
          zero=(r==0);
          negative=r[31];
          overflow=0;
          end
          
          4'b0010:
          begin
          r=a+b;
          zero=(r==0);
          negative=(r[31]==1);
          carry=0;
          
          //when two signed number adds,overflow occurs when they possoess same sign but the sign of result is contrary.
          overflow=(a[31]==b[31])&&(a[31]!=r[31]);
          end
          
          4'b0001:  // unsigned sub
          begin
          {carry,r}=a-b;
          zero=(r==0);
          negative=(r==1);
          overflow=0;
          end
          
          4'b0011://signed sub
          begin
          r=a-b;
          zero=(r==0);
          negative=(r[31]==1);
          carry=0;
          
          // when 2 signed number subs, like a-b,
          //only when a>0 b<0 but re<0  or  a<0 b>0 but re>0    the overflow variable=1;
          overflow=(a[31]==0&&b[31]==1&&r[31]==1)||(a[31]==1&&b[31]==0&&r[31]==0);
          end
          
          
          //logic
          4'b0100:  // and
          begin
          r=a&b;
          zero=(r==0);
          carry=0;
          negative=(r[31]==1);
          overflow=0;
          end
          
          4'b0101: //or
          begin
          r=a|b;
            zero=(r==0);
            carry=0;
            negative=(r[31]==1);
            overflow=0;
          end
          
          4'b0110:
          begin
          r=a^b; //xor
            zero=(r==0);
            carry=0;
            negative=(r[31]==1);
            overflow=0;
          end
          
          4'b0111:
          begin
          r=~(a|b);  //nor
            zero=(r==0);
            carry=0;
            negative=(r[31]==1);
            overflow=0;
          end
          
          //set the higher poses;
          4'b100z:
          begin
          r={b[15:0],16'b0};
          zero=(r==0);
          carry=0;
          negative=(r[31]==1);
          overflow=0;
          end
          
          4'b1011:  //comparision signed
          begin
          if(a[31]==1&&b[31]==0)
          begin
          r=1;
          end
          else if(a[31]==0&&b[31]==1)
          r=0;
          else r=(a[30:0]<b[30:0]);  // discard the sign!
          
          //here I have a question, when a b both negative what will happen
          zero=(a==b);
          negative=r;
          carry=0;
          overflow=0;
          end
          
          4'b1010:
          begin
          r=(a<b);
          carry=r;
          zero=(a==b);
          negative=(r[31]==1);
          overflow=0;
          end
          
          //move
          4'b1100:
          begin
          r=$signed(b)>>>a; //>>> is algorithm move
          zero=(r==0);
          negative=(r[31]==1);
          overflow=0;
          if(a>32)
          carry=b[31];
          else if(a==0)
          carry=0;
          else
          carry=b[a-1];
          end
          
          4'b111z:
          begin
          r=b<<a;
          zero=(r==0);
          negative=(r[31]==1);
          overflow=0;
          if(a>32)
          carry=b[0];
          else
          carry=b[31-a];
          end
          
          4'b1101:
          begin
          r=b>>a;
          zero=(r==0);
          if(a>32)
            carry=b[31];
            else if(a==0)
            carry=0;
            else
            carry=b[a-1];
          negative=(r[31]==1);
          overflow=0;
          end
          
          
       default:
       begin
       r=0;
       zero=0;carry=0;
       overflow=0;
       negative=0;
       end
       
       
          
       endcase
    
    end

endmodule //alu