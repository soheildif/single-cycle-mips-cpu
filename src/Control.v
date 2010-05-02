module Control(
    opcode,
    RegDst,
    Branch,
    MemRead,
    MemtoReg,
    ALUOp,
    MemWrite,
    ALUSrc,
    RegWrite
);
   
   input [5:0]  opcode;
   output 	RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
   output [1:0] ALUOp;
   reg [8:0] 	out;
   
   assign RegDst = out[8];
   assign Branch = out[7];
   assign MemRead = out[6];
   assign MemtoReg = out[5];
   assign MemWrite = out[4];
   assign ALUSrc = out[3];
   assign RegWrite = out[2];
   assign ALUOP = out[1:0];
   
   always @(opcode)
     case(opcode)
       6'b000000:
	 out = ;
       6'b001000:
	 out = ;
       6'b001100:
	 out = ;
       6'b001101:
	 out = ;
       6'b101011:
	 out = ;
       6'b100011:
	 out=;
       6'b000100:
	 out=;
     endcase // case (opcode)
   
endmodule
