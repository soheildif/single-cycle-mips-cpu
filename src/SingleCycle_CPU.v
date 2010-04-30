// UCA 2010
//=========================================================
// Single Cycle MIPS CPU
//=========================================================
// Supported instructions
// R-type: add, sub, and, or, slt
// I-type: addi, andi, ori, lw, sw, beq
//
//=========================================================
// Input/Output Signals:
// positive-edge triggered clock    clk
// active low asynchronous reset    rst_n
//
//=========================================================
// Wire/Reg Specifications:
// control signals                  RegDST, Branch, MemRead,
//                                  MemtoReg, ALUOp, MemWrite,   
//                                  ALUSrc, RegWrite
// MUX output signals               MUX_RegDST, MUX_ALUSrc, 
//                                  MUX_Branch, MUX_MemtoReg
//
//=========================================================

module SingleCycle_CPU(
    clk,
    rst_n
);

// input/output declaration
input   clk, rst_n;

// Wire/Reg declaration
// =========Write your code from here. Good luck!==========




PC PC(
    .clk        (),
    .rst_n      (),
    .pc_in      (),
    .pc_out     ()
);


Adder PC_Add_4(
    .data1_in   (),
    .data2_in   (),
    .data_out   ()
);


Instr_Memory Instr_Memory(
    .addr       (), 
    .instr      ()
);

/*
Control Control(
    .opcode     (),
    .RegDst     (),
    .Branch     (),
    .MemRead    (),
    .MemtoReg   (),
    .ALUOp      (),
    .MemWrite   (),
    .ALUSrc     (),
    .RegWrite   ()
);
*/

/*
MUX_5bit MUX_RegDst(
    .data1_in   (),
    .data2_in   (),
    .select     (),
    .data_out   ()
);
*/

Register_File Register_File(
    .clk        (),
    .Rs_addr    (),
    .Rt_addr    (),
    .Rd_addr    (), 
    .Rd_data    (),
    .RegWrite   (), 
    .Rs_data    (), 
    .Rt_data    () 
);

/*
Signed_Extend Signed_Extend(
    .data_in    (),
    .data_out   ()
);
*/

/*
Adder PC_Add_Offset(
    .data1_in   (),
    .data2_in   (),
    .data_out   ()
);
*/

/*
MUX_32bit MUX_ALUSrc(
    .data1_in   (),
    .data2_in   (),
    .select     (),
    .data_out   ()
);
*/

/*
ALU_Control ALU_Control(
    .funct      (),
    .ALUOp      (),
    .ALUCtrl    ()
);
*/
  
/*
ALU ALU(
    .data1_in   (),
    .data2_in   (),
    .ALUCtrl    (),
    .data       (),
    .Zero       ()
);
*/

/*
MUX_32bit MUX_Branch(
    .data1_in   (),
    .data2_in   (),
    .select     (),
    .data_out   ()
);
*/

Data_Memory Data_Memory(
    .clk        (),
    .addr       (),
    .data_in    (),
    .MemRead    (),
    .MemWrite   (),
    .data_out   ()
);

/*
MUX_32bit MUX_MemtoReg(
    .data1_in   (),
    .data2_in   (),
    .select     (),
    .data_out   ()
);
*/

endmodule
