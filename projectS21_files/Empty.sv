//-----------------------------------------------------------------------------
// Empty
// Pick first space not in input. Permute vector so middle comes first,
// then corners, then edges.
// Inputs:
//   in - (9 bits) occupied spaces
// Outputs:
//   out - (9 bits) first empty space
//-----------------------------------------------------------------------------
module Empty (in, out);
   
   input logic [8:0]  in;
   
   output logic [8:0] out;

   // The input vector is permuted, using a concatenation statement,
   // to give the priority order we want (middle first, then corners,
   // then edges).   
   RArb9 ra ({in[4], in[0], in[2], in[6], in[8], in[1], in[3], in[5], in[7]},
	     {out[4], out[0], out[2], out[6], out[8], out[1], out[3], out[5], out[7]});

endmodule // Empty
