module sub(input a,b,c,diff,borrow);
  assign diff=a^b;
  assign borrow=~a&b;
  assign diff=a^b^c;
  assign borrow=~(a&b)|(b&c)|~(a&c);
endmodule

module tb;
  reg a,b,c;
  wire diff,borrow;
  sub s(.*);
  initial begin
    a=0;b=0;c=0;
    $monitor("a=%b,b=%b,c=%b,diff=%b,borrow=%b",a,b,c,diff,borrow);
    #1 a=1;b=1;c=1;
    #1 a=0;b=1;c=0;
    #1 a=1;b=1;c=0;
    #1 a=0;b=1;c=1;
    #1 a=1;b=0;c=0;
    #10 $finish;
  end
endmodule
