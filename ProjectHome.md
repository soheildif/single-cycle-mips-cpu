This project aims to implement a single cycle MIPS CPU with Verilog. For the beginning, the supported instructions would be:

```
add, sub, and, or, slt
addi, andi, ori
lw, sw
beq
```

Hardware Specs:

---


  * Register File：32 × 32-bit Registers
  * Instruction Memory：1KB (256 × 32-bit )
  * Data Memory：32 Bytes (Memories are modeled in Verilog simply as an array of registers, so we did not care about the memory latency delay)
  * Address space: Text segment and data segment both begin at address 0x0000 for convenience, different from the real MIPS machine


Here is a simple overlook to the datapath with control:
![http://www.cs.nyu.edu/~gottlieb/courses/1999-00-fall/arch/datapath+control-small.png](http://www.cs.nyu.edu/~gottlieb/courses/1999-00-fall/arch/datapath+control-small.png)