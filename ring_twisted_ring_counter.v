module ring_counter#(parameter a=4'b1001)(input clk,rst,output reg [3:0] y);
  always @(posedge clk) begin
    if(rst) y<=4'b1001;
    else
      y<={y[0],y[3:1]};
  end
endmodule

module tb;
  reg clk,rst;
  wire [3:0] y;
  ring_counter rg(.clk(clk),.rst(rst),.y(y));
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;
    $monitor("clk=%0t,rst=%0b,y=%0b",$time,rst,y);
    #10 rst=0;
    #100 rst=1;
    #10 $finish;
  end
endmodule

//johnson counter

module johnson_counter#(parameter d=4'b0010)(input clk,rst,output reg[3:0] y);
  always @(posedge clk) begin
    if(rst)
      y<=d;
    else
      y<={~y[0],y[3:1]};
  end
endmodule

module tb;
  reg clk,rst;
  wire [3:0] y;
  johnson_counter jc(.rst(rst),.clk(clk),.y(y));
  always #5 clk=~clk;
  initial begin
    clk=0;rst=1;
    #10 rst=0;
    $monitor("clk=%0t,y=%b",$time,y);
    #100 rst=1;
    #10 $finish;
  end
endmodule
      

















  
