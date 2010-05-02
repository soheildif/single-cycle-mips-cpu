<<<<<<< .mine
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
wire [31:0] PCout, PCin, Inst, SignExtendOut, ALUout, MUX5out, MUX32out, RDdata1, RDdata2;
wire [2:0]  ALUCtrl;
wire [1:0]  ALUOp;
wire		Zero, RegDst, ALUSrc, RegWrite;


PC PC(
    .clk        (clk),
    .rst_n      (rst_n),
    .pc_in      (PCin),
    .pc_out     (PCout)
);


Adder PC_Add_4(
    .data1_in   (PCin),
    .data2_in   (4),
    .data_out   (PCout)
);


Instr_Memory Instr_Memory(
    .addr       (PCout), 
    .instr      (Inst)
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
    .clk        (clk),
    .Rs_addr    (Inst[25:21]),
    .Rt_addr    (Inst[20:16]),
    .Rd_addr    (MUX5out), 
    .Rd_data    (ALUout),
    .RegWrite   (RegWrite), 
    .Rs_data    (RDdata1), 
    .Rt_data    (RDdata2)
);


Signed_Extend Signed_Extend(
    .data_in    (Inst[15:0]),
    .data_out   (SignExtendOut)
);


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


ALU_Control ALU_Control(
    .funct      (Inst[5:0]),
    .ALUOp      (ALUOp),
    .ALUCtrl    (ALUCtrl)
);

  

ALU ALU(
    .data1_in   (RDdata1),
    .data2_in   (MUX32out),
    .ALUCtrl    (ALUCtrl),
    .data       (ALUout),
    .Zero       (Zero)
);


/*
MUX_32bit MUX_Branch(
    .data1_in   (),
    .data2_in   (),
    .select     (),
    .data_out   ()
);
*/

Data_Memory Data_Memory(
    .clk        (clk),
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
=======
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
wire RegDST, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Branch_Zero;
wire [2:0] ALUOp, ALUCtrl;
wire [4:0] MUX_RegDST;
wire [31:0] MUX_ALUSrc, MUX_Branch, MUX_MemtoReg, Instr, PC, PC_4, Rs_Data, Rt_Data, Immediate, Offset, PC_Offset, ALUResult, MemData;

assign Offset = Immediate << 2;
assign Branch_Zero = Branch & Zero;
   

PC PC(
    .clk        (clk),
    .rst_n      (rst_n),
    .pc_in      (MUX_Branch),
    .pc_out     (PC)
);


Adder PC_Add_4(
    .data1_in   (PC),
    .data2_in   (32'd4),
    .data_out   (PC_4)
);


Instr_Memory Instr_Memory(
    .addr       (PC), 
    .instr      (Instr)
);


Control Control(
    .opcode     (Instr[31:26]),
    .RegDst     (RegDST),
    .Branch     (Branch),
    .MemRead    (MemRead),
    .MemtoReg   (MemtoReg),
    .ALUOp      (ALUOp),
    .MemWrite   (MemWrite),
    .ALUSrc     (ALUSrc),
    .RegWrite   (RegWrite)
);


MUX_5bit MUX_RegDst(
    .data1_in   (Instr[20:16]),
    .data2_in   (Instr[15:11]),
    .select     (RegDST),
    .data_out   (MUX_RegDST)
);


Register_File Register_File(
    .clk        (clk),
    .Rs_addr    (Instr[25:21]),
    .Rt_addr    (Instr[20:16]),
    .Rd_addr    (MUX_RegDST), 
    .Rd_data    (MUX_MemtoReg),
    .RegWrite   (RegWrite), 
    .Rs_data    (Rs_Data), 
    .Rt_data    (Rt_Data) 
);


Signed_Extend Signed_Extend(
    .data_in    (Instr[15:0]),
    .data_out   (Immediate)
);


Adder PC_Add_Offset(
    .data1_in   (PC_4),
    .data2_in   (Offset),
    .data_out   (PC_Offset)
);



MUX_32bit MUX_ALUSrc(
    .data1_in   (Rt_Data),
    .data2_in   (Immediate),
    .select     (ALUSrc),
    .data_out   (MUX_ALUSrc)
);


ALU_Control ALU_Control(
    .funct      (Instr[5:0]),
    .ALUOp      (ALUOp),
    .ALUCtrl    (ALUCtrl)
);

  
ALU ALU(
    .data1_in   (Rs_Data),
    .data2_in   (MUX_ALUSrc),
    .ALUCtrl    (ALUCtrl),
    .data       (ALUResult),
    .Zero       (Zero)
);


MUX_32bit MUX_Branch(
    .data1_in   (PC_4),
    .data2_in   (PC_Offset),
    .select     (Branch_Zero),
    .data_out   (MUX_Branch)
);


Data_Memory Data_Memory(
    .clk        (clk),
    .addr       (ALUResult),
    .data_in    (Rt_Data),
    .MemRead    (MemRead),
    .MemWrite   (MemWrite),
    .data_out   (MemData)
);


MUX_32bit MUX_MemtoReg(
    .data1_in   (ALUResult),
    .data2_in   (MemData),
    .select     (MemtoReg),
    .data_out   (MUX_MemtoReg)
);

endmodule
>>>>>>> .r10
