//-----------------------------------------------------------------------------
// RArb9
// arbiter (arbitrary width) - MSB is highest priority
// Inputs:
//   r - Input vector
// Outputs:
//   g - One hot output has a bit set (if any) in the highest
//
//-----------------------------------------------------------------------------
module RArb9 (r, g);
   
   input logic [8:0]  r;
   
   output logic [8:0] g;
   
   logic [8:0] 	      c;
   
   assign c[8] = 1'b1;
   
   assign c[7] = ~r[8] & c[8]; 
   assign c[6] = ~r[7] & c[7];
   assign c[5] = ~r[6] & c[6];
   assign c[4] = ~r[5] & c[5];
   
   assign c[3] = ~r[4] & c[4];
   assign c[2] = ~r[3] & c[3];
   assign c[1] = ~r[2] & c[2];
   assign c[0] = ~r[1] & c[1];

   assign g = r & c;
   
endmodule // RArb9



