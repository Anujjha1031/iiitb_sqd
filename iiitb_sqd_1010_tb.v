module iiitb_sqd_1010_tb;
reg din,clk,reset;
wire y;
iiitb_sqd_1010 m1(din, reset, clk, y);
initial
begin
$dumpfile("iiitb_sqd_tb.vcd");
$dumpvars(0);
reset=0       ;clk=0;din=0;
$monitor($time, , ,"c=%b",clk,,"y=%b",y,,"r=%b",reset,,"d=%b",din);
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=0;
#10 din=1;
#10 din=0;
#5 din=1;
//#5 reset=1;
//#5 reset=0;

end
always
#5 clk=~clk;
initial
#80 $finish ;
endmodule
