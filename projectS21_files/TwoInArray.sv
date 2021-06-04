//-----------------------------------------------------------------------------
// TwoInArray
// Indicates if any row or column or diagonal in the array has two pieces of
// type a and no pieces of type b. (a and b can be x and o or o and x)
// Inputs:
//   ain, bin - (9 bits) array of types a and b
// Output:
//  cout - (9 bits) location of space to play in to complete row, column
//  or diagonal of a.
//
// If more than one space meets the criteria the output may have more than
// one bit set.
// If no spaces meet the criteria, the output will be all zeros.
//-----------------------------------------------------------------------------
module TwoInArray (ain, bin, cout);
   
   input logic [8:0]  ain, bin;
   
   output logic [8:0] cout;
   
   logic [8:0] 	      rows, cols;
   logic [2:0] 	      ddiag, udiag;
   
   // check each row
   TwoInRow topr (ain[2:0], bin[2:0], rows[2:0]);
   TwoInRow midr (ain[5:3], bin[5:3], rows[5:3]);
   TwoInRow botr (ain[8:6], bin[8:6], rows[8:6]);
   // check each column
   TwoInRow leftc ({ain[6], ain[3], ain[0]},
		   {bin[6], bin[3], bin[0]},
		   {cols[6], cols[3], cols[0]});
   TwoInRow midc ({ain[7], ain[4], ain[1]},
		  {bin[7], bin[4], bin[1]},
		  {cols[7], cols[4], cols[1]});
   TwoInRow rightc ({ain[8], ain[5], ain[2]},
		    {bin[8], bin[5], bin[2]},
		    {cols[8], cols[5], cols[2]});
   // check both diagonals
   TwoInRow dndiagx ({ain[8], ain[4], ain[0]}, {bin[8], bin[4], bin[0]}, ddiag);
   TwoInRow updiagx ({ain[6], ain[4], ain[2]}, {bin[6], bin[4], bin[2]}, udiag);
   // OR together the outputs
   assign cout = rows | cols
                 | {ddiag[2], 3'b000, ddiag[1], 3'b000, ddiag[0]}
                 | {2'b00, udiag[2], 1'b0, udiag[1], 1'b0, udiag[0], 2'b00};
   
endmodule // TwoInArray
