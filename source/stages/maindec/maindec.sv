
/**
* Decoder:
* Given the instruction, returns
* several information on what the
* given instruction does.
*/

module maindec(
		input logic [10:0] Op,
		output logic Reg2Loc,
		output logic ALUSrc,
		output logic MemtoReg,
		output logic RegWrite,
		output logic MemRead,
		output logic MemWrite,
		output logic BranchZero,
		output logic BranchNotZero,
		output logic [1:0] ALUOp);

	always_comb begin
		casez(Op)
			
			11'b111_1100_0010: // LDUR
			begin
				Reg2Loc = 0;
				ALUSrc = 1;
				MemtoReg = 1;
				RegWrite = 1;
				MemRead = 1;
				MemWrite = 0;
				BranchZero = 0;
				BranchNotZero = 0;
				ALUOp = 2'b00;
			end
				
			11'b111_1100_0000: // STDUR
			begin
				Reg2Loc = 1;
				ALUSrc = 1;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 1;
				BranchZero = 0;
				BranchNotZero = 0;
				ALUOp = 2'b00;
			end
				
			11'b101_1010_0???: // CBZ
			begin
				Reg2Loc = 1;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				BranchZero = 1;
				BranchNotZero = 0;
				ALUOp = 2'b01;
			end
				
			// Type-R
			11'b100_0101_1000, // ADD
			11'b110_0101_1000, // SUB
			11'b100_0101_0000, // AND
			11'b101_0101_0000: // ORR
			begin
				Reg2Loc = 0;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				BranchZero = 0;
				BranchNotZero = 0;
				ALUOp = 2'b10;
			end
			
			// ADDI
			11'b100_1000_100?:
			begin
				Reg2Loc = 0;
				ALUSrc = 1;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				BranchZero = 0;
				BranchNotZero = 0;
				ALUOp = 2'b10;
			end
			
			11'b101_1010_1???: // CBNZ
			begin
				Reg2Loc = 1;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				BranchZero = 0;
				BranchNotZero = 1;
				ALUOp = 2'b01;
			end
		
			default: // ALL ZEROS
			begin
				Reg2Loc = 0;
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				BranchZero = 0;
				BranchNotZero = 0;
				ALUOp = 2'b00;
			end
			
		endcase
	end
		
endmodule
