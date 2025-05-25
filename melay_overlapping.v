module mealy_overlap(input clk,rst,x,output reg z);//my sequence is 1011
  parameter a=4'h1;parameter b=4'h2;parameter c=4'h3;parameter d=4'h4;
  reg [3:0] state;
  always @(posedge clk or posedge rst) begin
    if(rst) state<=a;
    else
      case(state)
        a:state<=x?b:a;
        b:state<=x?b:c;
        c:state<=x?d:a;
        d:state<=x?b:c;
        default:state<=a;
      endcase
  end
  assign z=(state==d)&&(x==1)?1:0;
endmodule

module tb;
  reg clk,rst,x;
  wire z;
  mealy_overlap ma(.*);
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    $monitor("clk=%0t,x=%b,z=%b",$time,x,z);
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=1;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 $finish;
  end
endmodule






    
