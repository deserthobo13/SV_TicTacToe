//-----------------------------------------------------------------------------
// TicTacToe
// Generates a move for X in the game of tic-tac-toe
// Inputs:
//
// xin, oin - (9-bit) current positions of X and O.
// Out:
//  xout - (9-bit) one hot position of next X.
//
// Inputs and outputs use a board mapping of:
//
// 0 | 1 | 2
// ---+---+---
// 3 | 4 | 5
// ---+---+---
// 6 | 7 | 8
//
// The top-level circuit instantiates strategy modules that each generate
// a move according to their strategy and a selector module that selects
// the highest-priority strategy module with a move.
//
// The win strategy module picks a space that will win the game if any exists.
//
// The block strategy module picks a space that will block the opponent
// from winning.
//
// The empty strategy module picks the first open space - using a particular
// ordering of the board.
//-----------------------------------------------------------------------------

module TicTacToe (xin, oin, next_move);

   input logic [8:0]  xin, oin;
   
   output logic [8:0] next_move;
   
   logic [8:0]	      emptycheck;   
   logic [8:0] 	      adjacent;   
   
   logic [8:0] 	      win, block, empty;
   logic [8:0] 	      move;
   
   // win if we can   
   TwoInArray winx (xin, oin, win);
   // try to block o from winning   
   TwoInArray blockx (oin, xin, block);
   // otherwise pick empty space
   assign emptycheck = ~(oin | xin);   
   Empty emptyx (emptycheck, empty);
   // pick highest priority   
   Select4 comb (win, block, adjacent, empty, move);
   // playing adjancent edge
   playing_adjacent_edge adj (xin, oin, adjacent);

   assign next_move = {(xin[8] | move[8]),
		       (xin[7] | move[7]),
		       (xin[6] | move[6]), 
		       (xin[5] | move[5]), 
		       (xin[4] | move[4]), 
		       (xin[3] | move[3]), 
		       (xin[2] | move[2]), 
		       (xin[1] | move[1]), 
		       (xin[0] | move[0])};


endmodule // TicTacToe
