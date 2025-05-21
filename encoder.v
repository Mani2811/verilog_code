module encoder(input [7:0] i,input en,output reg [2:0]y);
  always @(*) begin
    if(i[7]==1) y=3'b111;
    else if(i[6]==1) y=3'b110;
    else if(i[5]==1) y=3'b101;
    else if(i[4]==1) y=3'b100;
    else if(i[3]==1) y=3'b011;
    else if(i[2]==1) y=3'b010;
    else if(i[1]==1) y=3'b001;
    else y=3'b000;
  end
endmodule

module tb;
  reg [7:0] i;
  reg en;
  wire [2:0] y;
  encoder er(.i(i),.en(en),.y(y));
  initial begin
    en=1;
    $monitor("i=%b,y=%b",i,y);
    #1 i=8'h0;
    #1 i=8'h4;
    #1 i=8'h16;
    #1 i=8'h2;
    #10 $finish;
  end
endmodule

/// decoder

module decoder (input [2:0] i,input en,output [7:0] y);
  always @(*) begin
    case(i)
      3'b000:y[0]=1'b1;
      3'b001:y[1]=1'b1;
      3'b010:y[2]=1'b1;
      3'b011:y[3]=1'b1;
      3'b100:y[4]=1'b1;
      3'b101:y[5]=1'b1;
      3'b110:y[6]=1'b1;
      3'b111:y[7]=1'b1;
      default:y=8'bxxxx_xxxx;
    endcase
  end
endmodule

module tb;
  reg [2:0] i;
  reg en;
  wire [7:0] y;
  decoder de(.i(i),.en(en),.y(y));
  initial begin
    en=1;
    $monitor("i=%0b,y=%0b",i,y);
    #1 i=3'b100;
    #1 i=3'b001;
    #1 i=3'b101;
    #1 i=3'b010;
    #1 i=3'b110;
    #1 i=3'b111;
  end
endmodule







    




