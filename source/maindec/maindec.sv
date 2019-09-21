module maindec(
		input logic [10:0] Op,
		output logic Reg2Loc,
		output logic ALUSrc,
		output logic MemtoReg,
		output logic RegWrite,
		output logic MemRead,
		output logic MemWrite,
		output logic Branch,
		output logic [1:0] ALUOp);

	always_comb begin
		casez(Op)
			
			11'b111_1100_0010: // LDUR
				Reg2Loc = 0;
				ALUSrc = 1;
				MemtoReg = 1;
				RegWrite = 1;
				MemRead = 1;
				MemWrite = 0;
				Branch = 0;
				ALUOp = 2'b00;
				
			11'b111_1100_0000: // STDUR
				Reg2Loc = 1;
				ALUSrc = 1;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 1;
				Branch = 0;
				ALUOp = 2'b00;
				
			11'b101_1010_0???: // CBZ
				Reg2Loc = 1;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				Branch = 1;
				ALUOp = 2'b01;
				
			// TODO: Type-R
			
		endcase
	end
		
endmodule
