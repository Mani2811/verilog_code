////d_flipflop
module d_ff(input clk,reset,d,output reg y);
  always @(posedge clk) begin
    if(reset) y<=1'b0;
    else
      y<=d;
  end
endmodule

module tb;
  reg clk,reset,d;
  wire y;
  d_ff de(.clk(clk),.reset(reset),.d(d),.y(y));
  always #5 clk=~clk;
  initial begin
    clk=0;reset=1;
    #10 reset=0;
    $monitor("clk=%0t,d=%b,y=%b",$time,d,y);
    #10  d=1'b0;
    #10  d=0;
    #10 d=1;
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #10 $finish;
  end
endmodule

///t_flipflop
module t_ff(input clk,reset,t,output reg y);
  always @(posedge clk) begin
    if(reset) y<=1'b0;
    else if(t)
      y<=~y;
  end
endmodule

module tb;
  reg clk,reset,t;
  wire y;
  t_ff tw(.clk(clk),.reset(reset),.t(t),.y(y));
  always #5 clk=~clk;
  initial begin
    q=0;clk=0;reset=1;
    #10 reset=0;
    #10 t=1;
    #20 t=0;
    #40 t=1;
    #10 $finish;
  end
endmodule

/////sr_flipflop
module sr_ff(input clk,reset,s,r,output reg q);
  always @(posedge clk) begin
    if(reset) q<=0;
    else begin
      case({s,r})
        2'b00:q<=q;
        2'b01:q<=1'b0;
        2'b10:q<=1'b1;
        2'b11:q<=1'bx;
        default q<=1'b0;
      endcase
    end
  end
endmodule

module tb;
  reg clk,reset,s,r;
  wire q;
  sr_ff se(.clk(clk),.reset(reset),.s(s),.r(r),.q(q));
  always #5 clk=~clk;
  initial begin
    clk=0;reset=1;
    #1 reset=0;
    $monitor("clk=%0t,s=%b,r=%b,q=%b",$time,s,r,q);
    #10 s=0;r=1;
    #10 s=1;r=1;
    #10 s=0;r=0;
    #10 s=1;r=0;
    #10 s=1;r=1;
    #10 $finish;
  end
endmodule

////jk_flipflop

module  jk_ff(input clk,reset,j,k,output reg q);
  always @(posedge clk) begin
    if(reset) q<=1'b0;
    else begin
      case({j,k})
        2'b00:q<=q;
        2'b01:q<=0;
        2'b10:q<=1;
        2'b11:q<=~q;
        default q<=0;
      endcase
    end
  end
endmodule

module tb;
  reg clk,reset,j,k;
  wire q;
  jk_ff de(.clk(clk),.reset(reset),.j(j),.k(k),.q(q));
  always #5 clk=~clk;
  initial begin
    clk=0;reset=1;
    #1 reset=0;
    $monitor("clk=%0t,j=%b,k=%b,q=%b",$time,j,k,q);
    #10 j=0;k=1;
    #10 j=1;k=0;
    #10 j=0;k=0;
    #10 j=1;k=1;
    #10 j=0;k=0;
    #10 $finish;
  end
endmodule

////dlatch
module d_latch(input en,reset,d,output q);
  always @(*) begin
    if(en |!reset) q<=d;
  else q<=0;
  end
endmodule

module tb;
  reg reset,en,d;
  wire q;
  d_latch de(.*);
  initial begin
    $monitor("en=%b,d=%b,q=%b",en,d,q);
    #10 en=1; d=0;
    #10 d=1;
    #10 d=0;
    #10 en=0;d=1;
    #10 $finish;
  end
endmodule

























