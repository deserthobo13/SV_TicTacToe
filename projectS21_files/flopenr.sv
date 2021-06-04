`timescale 1ns/1ns
module flopenr #(parameter WIDTH = 8)
   (input  logic             clk,
    input logic              reset,
    input logic              en, 
    input logic [WIDTH-1:0]  d, 
    output logic [WIDTH-1:0] q);

  // asynchronous reset 
  always_ff @(posedge clk, posedge reset)
    if      (reset) q <= #1 0;
    else if (en)    q <= #1 d;

endmodule // flopren

