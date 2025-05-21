module full_adder(input a1,b1,c1,output sum1,carry);
  assign sum1=a1^b1^c1;
  assign carry=a1&b1|b1&c1|c1&a1;
endmodule

module riple#(parameter d=4)(input [d-1:0] a,b,input cin, output [d-1:0] sum, carry_in);
  genvar g;
  full_adder fa(a[0],b[0],cin,sum[0],carry_in[0]);
  generate
    for(g=1;g<d<g++)
      full_adder faq(a[g],b[g],carry_in[g-1],sum[g],carry_in[g]);
    end
  endgenerate
endmodule

module tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire carry;
  riple ra(.*);
  initial begin
    a=4'b0000;b=4'b0000;cin=0;
    $monitor("a=%b,b=%b,cin=%b,sum=%b,carry=%b",a,b,cin,sum,carry);
    #1 a=1001;b=1000;cin=1;
    #1 a=1010;b=1011;cin=0;
    #1 a=1100;b=1101;cin=1;
    #1 a=0101;b=1011;cin=0;
    #10 $finish;
  end
endmodule
