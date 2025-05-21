module logic_gate(input a,b,output c);
assign c=a &b;
assign c=a|b;
assign c=a^b;
assign c=~(a&b);
assign c=~(a|b);
assign c=~(a^b);
assign c=~a;
endmodule
module tb
reg a,b;
wire c;
logic_gate ed(.a(a),.b(b),.c(c));
initial begin
a=0;b=0;
$monitor("a=%b,b=%b,c=%b",a,b,c);
#1 a=1;b=0;
#1 a=0;b=1;
#1 a=1;b=1;
#1 a=0;b=0;
#1 a=1;b=0;
end
endmodule
