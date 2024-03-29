
/* TestBench 
* Top-Level Entity: fetch */

module fetch_tb();

	logic PCSrc_F;
	logic clk;
	logic reset;
	logic [63:0] PCBranch_F;
	logic [63:0] imem_addr_F;
	
	// intialize device under test
	fetch dut(PCSrc_F, clk, reset, PCBranch_F, imem_addr_F);
	
	// Setup Clock
	
	always begin
		clk = 0; #10ns; clk = 1; #10ns;
	end
	
	// Test
	
	initial begin
		
		PCBranch_F = 64'b0101;
		PCSrc_F = 0; reset = 1; #50ns; 
		
		/**
		* We wait 10 clock cycles 
		* to check the PC actually increments by 4 */
		reset = 0; #50ns;
		
		/** 
		* We turn the PCSrc_F to Positive Value
		* to check if the value we are receiving
		* is actually the PCBranch_F */
		PCSrc_F = 1;
		#10ns; PCBranch_F = 64'b1111;
		
		#20ns;
		$stop;
	
	end

endmodule
