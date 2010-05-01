/* =============================================================================
 *
 * Name           : ALU_Control.v
 * Author         : Hakki Caner Kirmizi
 * Date           : 2010-5-1
 * Description    : A module that implements an ALU Control unit which gets two
 *					inputs (funct, ALUOp) and generates the 3-bit ALUCtrl signal
 *					We have to support these instruction:
 *					add, sub, and, or, slt, addi, andi, ori, lw, sw, beq
 * References	  : http://www.sdsc.edu/~allans/cs141/L8.pdf
 * 
 * Generating ALU Signals:
 * -----------------------
 * ALUOp		Function		ALUCtrl		Instr. Opcode
 * -----		--------		-------		-------------
 * 00			xxxxxx			010			lw, sw
 * 01			xxxxxx			110			beq
 * 10			100000			010			add
 * 10			100010			110			sub
 * 10			100100			000			and
 * 10			100101			001			or
 * 10			101010			111			slt
 * 
 * Note: Adding ‘addi, andi, ori’ does not require any changes in the given 
 * ALU because they are already covered in their R-format counterparts. However, 
 * we assume that 6-bit function code which is input to the ALU control circuit 
 * will be correctly generated at the main control circuit.
 * 
 * =============================================================================
*/

module ALU_Control(
	funct,
	ALUOp,
	ALUCtrl
);

input	[15:0]	funct;		// 16-bit represents instruction's 'address' part
input	[1:0]	ALUOp;		// 2-bit comes from Control
output	[2:0]	ALUCtrl;	// 3-bit control signal represents the operation type, e.g. add, or etc..

assign ALUCtrl[2] = ~ALUOp[0] | (~ALUOp[1] & funct[1]);
assign ALUCtrl[1] = ALUOp[1] | funct[2];
assign ALUCtrl[0] = ALUOp[1] & (funct[0] & funct[3]);

endmodule