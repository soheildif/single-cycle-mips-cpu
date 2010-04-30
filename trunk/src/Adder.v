// ===================================================
// 
// Name           : Adder.v
// Author         : Hakki Caner Kirmizi
// Date           : 2010-4-30
// Description    : A module that sums up two 32-bit 
//                  input and assigns to 32-bit output
//                  
// ===================================================

module Adder(
    .data1_in,
    .data2_in,
    .data_out
);

// Interface
input   [31:0]  data1_in;
input   [31:0]  data2_in;
output  [31:0]  data_out;

assign data_out = data1_in + data2_in;
  
endmodule