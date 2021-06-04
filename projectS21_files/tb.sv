`timescale 1ns / 1ps
module tb ();

   logic [8:0] xin;
   logic [8:0] xin_star;
   logic [8:0] oin_star;   
   logic 	   Go, bad_move,draw_game,win_game,lose_game, playing_game;
   
   logic       clk;
   logic       reset;  

	logic [8:0] xin_store;
assign xin_store = {(xin[8] | xin_star[8]), (xin[7] | xin_star[7]),
(xin[6] | xin_star[6]), (xin[5] | xin_star[5]),
(xin[4] | xin_star[4]), (xin[3] | xin_star[3]),
(xin[2] | xin_star[2]), (xin[1] | xin_star[1]),
(xin[0] | xin_star[0])};

   integer     handle3;  
   integer 	   desc3;    

   // instantiate device under test   
   top dut (xin, xin_star, oin_star, Go, bad_move, draw_game, win_game, lose_game, playing_game, reset, clk);   

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

   initial
     begin
        handle3 = $fopen("top.out");  
        #240 $finish;                
     end

   always 
     begin
        desc3 = handle3;	
        #20 $fdisplay(desc3, "xin: %b xin_star: %b oin_star: %b Go: %b Bad: %b draw: %b win: %b lose: %b playing: %b xin_store: %b", xin, xin_star, oin_star, Go, bad_move, draw_game, win_game, lose_game, playing_game, xin_store);
     end

   // Example of TicTacToe playing against itself
   // (see example (Figure 3) in lab)
   initial
     begin
	// Initialization of board (X is going)
	#0   reset = 1'b1;
	
	#5	 reset = 1'b0;
	
	#5	Go = 1'b0;
	#0	xin = 9'b100_000_000;
	#10	Go = 1'b1;
	
	#5	Go = 1'b0;
	#0	xin = 9'b000_000_001;
	#10	Go = 1'b1;
	
	#1	Go = 1'b0;
	#0	xin = 9'b000_001_000;
	#10	Go = 1'b1;
	
	#1	Go = 1'b0;
	#0	xin = 9'b010_000_000;
	#10	Go = 1'b1;
	
     end

   
endmodule
