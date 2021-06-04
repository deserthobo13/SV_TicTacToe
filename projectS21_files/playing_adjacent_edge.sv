module playing_adjacent_edge (xin, oin, adjacent);

   input logic [8:0] xin;
   input logic [8:0] oin;

   output logic [8:0] adjacent;

   logic 	      adj;
   logic [8:0] 	      adj1;
   logic [8:0] 	      adj0;   

   // Let's check adjacent positioning
   assign adj = (oin[0] & ~oin[1] & ~oin[2] &
		 ~oin[3] & ~oin[4] & ~oin[5] &
		 ~oin[6] & ~oin[7] & oin[8] &
		 ~xin[0] & ~xin[1] & ~xin[2] &
		 ~xin[3] & xin[4] & ~xin[5] &
		 ~xin[6] & ~xin[7] & ~xin[8]);

   // Move in H if scenario occurs
   assign adj1 = 9'b000_001_000;
   assign adj0 = 9'b000_000_000;
   assign adjacent = adj ? adj1 : adj0; 

endmodule // playing_adjacent_edge
