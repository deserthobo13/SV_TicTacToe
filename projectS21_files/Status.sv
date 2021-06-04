module Status(xin_star, oin_star, win_game, draw_game, bad_move, playing_game, lose_game);
input logic [8:0] xin_star, oin_star;
output logic win_game, draw_game, bad_move, playing_game, lose_game;
	
assign win_game = ((xin_star[0] & xin_star[1] & xin_star[2]) |
	(xin_star[3] & xin_star[4] & xin_star[5]) |
	(xin_star[6] & xin_star[7] & xin_star[8]) |
	(xin_star[0] & xin_star[3] & xin_star[6]) |
	(xin_star[1] & xin_star[4] & xin_star[7]) |
	(xin_star[2] & xin_star[5] & xin_star[8]) |
	(xin_star[0] & xin_star[4] & xin_star[8]) |
	(xin_star[2] & xin_star[4] & xin_star[6]));

assign draw_game = ((xin_star[0] | oin_star[0]) &
	(xin_star[1] | oin_star[1]) &
	(xin_star[2] | oin_star[2]) &
	(xin_star[3] | oin_star[3]) &
	(xin_star[4] | oin_star[4]) &
	(xin_star[5] | oin_star[5]) &
	(xin_star[6] | oin_star[6]) &
	(xin_star[7] | oin_star[7]) &
	(xin_star[8] | oin_star[8]));
	
assign bad_move = ((xin_star[8] & oin_star[8]) |
	(xin_star[7] & oin_star[7]) |
	(xin_star[6] & oin_star[6]) |
	(xin_star[5] & oin_star[5]) |
	(xin_star[4] & oin_star[4]) |
	(xin_star[3] & oin_star[3]) |
	(xin_star[2] & oin_star[2]) |
	(xin_star[1] & oin_star[1]) |
	(xin_star[0] & oin_star[0])) & ~(win_game | lose_game);
	
assign lose_game = ((oin_star[0] & oin_star[1] & oin_star[2]) |
	(oin_star[3] & oin_star[4] & oin_star[5]) |
	(oin_star[6] & oin_star[7] & oin_star[8]) |
	(oin_star[0] & oin_star[3] & oin_star[6]) |
	(oin_star[1] & oin_star[4] & oin_star[7]) |
	(oin_star[2] & oin_star[5] & oin_star[8]) |
	(oin_star[0] & oin_star[4] & oin_star[8]) |
	(oin_star[2] & oin_star[4] & oin_star[6])) & ~win_game;
	
assign playing_game = ~(bad_move | win_game | lose_game | draw_game);

endmodule