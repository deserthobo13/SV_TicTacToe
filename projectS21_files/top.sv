module top(xin, xin_star, oin_star, Go, bad_move, draw_game, win_game, lose_game, playing_game, reset, clock);

input logic [8:0] xin;
input logic Go, reset, clock;
output logic [8:0] xin_star, oin_star;
output logic win_game, draw_game, bad_move, playing_game, lose_game;
logic [8:0] next_move;
logic [8:0] xin_store;
logic EN;
logic store_result;

assign EN = store_result & playing_game;

assign xin_store = {(xin[8] | xin_star[8]), (xin[7] | xin_star[7]),
(xin[6] | xin_star[6]), (xin[5] | xin_star[5]),
(xin[4] | xin_star[4]), (xin[3] | xin_star[3]),
(xin[2] | xin_star[2]), (xin[1] | xin_star[1]),
(xin[0] | xin_star[0])};

FSM fsmx(~clock, reset, Go, store_result);

TicTacToe game(oin_star, xin_store, next_move);

Status statusx(xin_star, oin_star, win_game, draw_game, bad_move, playing_game, lose_game);

flopenr #(9) reg1(clock, reset, EN, xin_store, xin_star);

flopenr #(9) reg2(clock, reset, EN, next_move, oin_star);

endmodule