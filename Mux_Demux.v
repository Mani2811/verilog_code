module mux(input i0,i1,s,output y);
  assign y=s?i1:i0;
endmodule

module tb;
  reg i0,i1,s;
  wire y;
  mux m1(.i0(i0),.i1(i1),.s(s),.y(y));
  initial begin
     i0=0;i1=0;
    $monitor("i0=%b,i1=%b,s=%b,y=%b",i0,i1,s,y);
    #1 i0=1;i1=0;s=1;
    #1 i0=0;i1=1;s=0;
    #1 i0=1;i1=1;s=1;
    #10 $finish;
  end
endmodule

////demux

module demux(input i,s,output y0,y1);
  assign {y0,y1}=s?{1'b0,i}:{i,1'b0};
endmodule

module tb;
  reg i,s;
  wire y0,y1;
  demux d1(.i(i),.s(s),.y0(y0),y1(y1));
  initial begin
    $monitor("i=%b,s=%b,y0=%b,y1=%b",i,s,y0,y1);
    #1 i=0;s=1;
    #1 i=1;s=0;
    #1 i=1;s=1;
    #1 i=0;s=0;
    #1 $finish;
  end
endmodule
