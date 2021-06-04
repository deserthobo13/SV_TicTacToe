//-----------------------------------------------------------------------------
// 4-input Priority Arbiter
// Outputs the index of the input with the highest value
// Inputs:
//   in0, in1, in2, in3 - n-bit binary input values
// Out:
//   out - 2-bit index of the input with the highest value
//
// We pick the "winning" output via a tournament.
// In the first round we compare in0 against in1 and in2 against in3
// The second round compares the winners of the first round.
// The MSB comes from the final round, the LSB from the selected first round.
//
// Ties are given to the lower numbered input.
//-----------------------------------------------------------------------------
module PriorityArbiter (in0, in1, in2, in3, out);
   parameter n = 8 ; // width of inputs
   
   input logic [n-1:0]  in0, in1, in2, in3;
   
   output logic [1:0] 	out;
   
   logic [n-1:0] 	match0winner, match1winner;
   
   // first round of tournament
   MagComp #(n) round0match0 (in1, in0, c1gt0) ; // compare in0 and in1
   MagComp #(n) round0match1 (in3, in2, c3gt2) ; // compare in2 and in3
   
   // select first round winners
   mux2 #(n) match0 (in0, in1, c1gt0, match0winner) ;
   mux2 #(n) match1 (in2, in3, c3gt2, match1winner) ;
   
   // compare round0 winners
   MagComp #(n) round1 (match1winner, match0winner, out[1]) ;

   // select winning LSB index
   mux2 #(1) winningLSB (c1gt0, c3gt2, out[1], out[0]) ;

endmodule // PriorityArbiter
