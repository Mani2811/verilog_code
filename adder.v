module adder(input a,b,c,output sum,carry);
  assign sum=a^b;
  assign carry=a&b;
assign sum=a^b^c;
assign carry=(a&b|b&c|a&c);
endmodule

module tb;
reg a,b,c;
wire sum,carry;
adder ad(.*);
initial begin
a=0;b=0;c=0;
$monitor("a=%b,b=%b,c=%b,sum=%b,carry=%b",a,b,c,sum,carry);
#1 a=1;b=1;c=1;
#1 a=0;b=1;c=1;
#1 a=1;b=1;c=0;
#1 a=0;b=1;c=0;
#10 $finish;
end
endmodule
