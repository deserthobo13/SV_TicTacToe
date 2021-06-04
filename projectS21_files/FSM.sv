module FSM (clock, reset_b, Go, store_result);
   
   output logic store_result;
   
   input logic  reset_b;
   input logic 	Go, clock;
   
   // State definitions as an enumerated type
   typedef enum logic [1:0] {S0, S1, S2} statetype;
   statetype CURRENT_STATE, NEXT_STATE;

   
   // State Register
   always_ff @(posedge clock, posedge reset_b) 
     begin
	if (reset_b)
	  CURRENT_STATE <= S0;
	else
	  CURRENT_STATE <= NEXT_STATE;
     end   

   // Next State Logic
   always_comb
     begin
	case (CURRENT_STATE)
	  S0: begin
	     if (Go==1'b1) 
			begin
			NEXT_STATE = S1;
			end
		 else 
			begin
			NEXT_STATE = S0;   
			end
	store_result = 1'b0;
	  end
	  S1: begin
	     NEXT_STATE = S2;	     
		 store_result = 1'b1;
	  end
	  S2: begin
	     if (Go==1'b0) 
			begin
			NEXT_STATE = S0;
			end
		 else 
			begin
			store_result = 1'b0;
			NEXT_STATE = S2;
			end
	  end
	  default: begin
		 store_result = 1'b0;
		 NEXT_STATE = S0;
	  end
	endcase
	  end
  
endmodule // FSM

