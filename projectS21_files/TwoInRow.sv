//-----------------------------------------------------------------------------
// TwoInRow
// Indicates if a row (or column, or diagonal) has two pieces of type a
// and no pieces of type b. (a and b can be x and o or o and x)
// Inputs:
//   ain, bin - (3 bits) row of types a and b.
// Outputs:
//  cout - (3 bits) location of empty square if other two are type a.
//-----------------------------------------------------------------------------
module TwoInRow (ain, bin, cout);
   
   input logic [2:0] ain, bin;
   
   output logic [2:0] cout;
   
   assign cout[0] = ~bin[0] & ~ain[0] & ain[1] & ain[2];
   assign cout[1] = ~bin[1] & ain[0] & ~ain[1] & ain[2];
   assign cout[2] = ~bin[2] & ain[0] & ain[1] & ~ain[2];

endmodule // TwoInRow

