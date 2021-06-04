//-----------------------------------------------------------------------------
// Select3
// Picks the highest priority bit from 3 9-bit vectors
// Inputs:
//   a, b, c - (9 bits) Input vectors
// Outputs:
//   out - (9 bits) One hot output has a bit set (if any) in the highest
//   position of the highest priority input.
//-----------------------------------------------------------------------------
module Select4 (a, b, c, d, out);
   
   input logic [8:0]  a, b, c, d;
   
   output logic [8:0] out;
   
   logic [35:0]       x;
   
   RArb36 ra ({a, b, c, d}, x);
   assign out = x[35:27] | x[26:18] | x[17:9] | x[8:0];
   
endmodule // Select4
