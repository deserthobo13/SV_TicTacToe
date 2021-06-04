//-----------------------------------------------------------------------------
// RArb36
// arbiter (arbitrary width) - MSB is highest priority
// Inputs:
//   r - Input vector
// Outputs:
//   g - One hot output has a bit set (if any) in the highest
//
//-----------------------------------------------------------------------------
module RArb36 (r, g);
   
   input logic [35:0]  r;
   
   output logic [35:0] g;

   logic [35:0]        c;

   assign c[35] = 1'b1;

   assign c[34] = ~r[35] & c[35];
   assign c[33] = ~r[34] & c[34];
   assign c[32] = ~r[33] & c[33];   
   
   assign c[31] = ~r[32] & c[32];   
   assign c[30] = ~r[31] & c[31];
   assign c[29] = ~r[30] & c[30];
   assign c[28] = ~r[29] & c[29];   

   assign c[27] = ~r[28] & c[28];   
   assign c[26] = ~r[27] & c[27];
   assign c[25] = ~r[26] & c[26];
   assign c[24] = ~r[25] & c[25];
   
   assign c[23] = ~r[24] & c[24];
   assign c[22] = ~r[23] & c[23];
   assign c[21] = ~r[22] & c[22];
   assign c[20] = ~r[21] & c[21];
   
   assign c[19] = ~r[20] & c[20];
   assign c[18] = ~r[19] & c[19];
   assign c[17] = ~r[18] & c[18];
   assign c[16] = ~r[17] & c[17];
   
   assign c[15] = ~r[16] & c[16];
   assign c[14] = ~r[15] & c[15];
   assign c[13] = ~r[14] & c[14];
   assign c[12] = ~r[13] & c[13];
   
   assign c[11] = ~r[12] & c[12];
   assign c[10] = ~r[11] & c[11];
   assign c[9] = ~r[10] & c[10];
   assign c[8] = ~r[9] & c[9];
   
   assign c[7] = ~r[8] & c[8]; 
   assign c[6] = ~r[7] & c[7];
   assign c[5] = ~r[6] & c[6];
   assign c[4] = ~r[5] & c[5];
   
   assign c[3] = ~r[4] & c[4];
   assign c[2] = ~r[3] & c[3];
   assign c[1] = ~r[2] & c[2];
   assign c[0] = ~r[1] & c[1];

   assign g = r & c;
   
endmodule // RArb36
