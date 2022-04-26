/*
 * LFSR pseudo-random number generation
 * -----------------------
 * By: Bolun Li(201578765)
 * Data: 17th April 2022
 * 
 * Module Description:
 * -----------------------
 * Random number generation via LSFR for determining 
 * whether the newly generated data is 2 or 4.
 */

module Random(
	input					clk,
	input					rst_n,
	input					load,
	output reg	[7:0]	randNum
);

parameter seed = 8'b11010111;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		randNum <= 8'b0;
	else if(load)
		randNum <= seed;
	else
		begin
			randNum[0] <= randNum[7];
			randNum[1] <= randNum[0];
			randNum[2] <= randNum[1];
			randNum[3] <= randNum[2];
			randNum[4] <= randNum[3]^randNum[7];
			randNum[5] <= randNum[4]^randNum[7];
			randNum[6] <= randNum[5]^randNum[7];
			randNum[7] <= randNum[6];
		end
end

endmodule