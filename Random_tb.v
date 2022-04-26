`timescale 1 ns/100 ps
module Random_tb();

parameter ClockPeriod = 4 ;

reg clkInital;
reg rst_n;
reg load;

wire [7:0] randNum;

Random dut(
	.clk		(clkInital),
	.rst_n	(rst_n),
	.load		(load),
	.randNum	(randNum)
);

initial
	begin
		clkInital = 0;
		//rst_n
		rst_n = 0;
		load = 0;
		#10;
		rst_n = 1;
		load = 1;
		#10;
		load = 0;
	end
	
initial
	begin
	forever
	# (ClockPeriod/2) clkInital = ~clkInital ;
	end
	
endmodule
