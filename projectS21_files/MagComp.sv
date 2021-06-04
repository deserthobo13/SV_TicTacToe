//-----------------------------------------------------------------------------
// MagComp
// LSB-first magnitude comparator
// Inputs:
//   a - Input vector
//   b - Input vector
// Outputs:
//   gt - a > b ? 
//
// Note: this module is parameterized
//-----------------------------------------------------------------------------
module MagComp(a, b, gt); 
   parameter k=8;
   
   input logic [k-1:0]  a, b; 

   output logic 		gt;

   logic [k-1:0] 		eqi;
   logic [k-1:0] 		gti;
   logic [k:0] 			gtb;
   
   assign eqi=a ~^ b;
   assign gti=a & ~b;
   assign gtb = {((eqi[k-1:0] & gtb[k-1:0]) | gti[k-1:0]), 1'b0}; 
   assign gt = gtb[k];
   
endmodule // MagComp
