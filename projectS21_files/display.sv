module display(input logic [8:0] move,
				output logic [3:0] fourBit);
				
   always_comb
	case (move)
	//abc_defg
	9'b0_0000_0001:		fourBit=4'b0000;
	9'b0_0000_0010:		fourBit=4'b0001;
	9'b0_0000_0100:		fourBit=4'b0010;
	9'b0_0000_1000:		fourBit=4'b0011;
	9'b0_0001_0000:		fourBit=4'b0100;
	9'b0_0010_0000:		fourBit=4'b0101;
	9'b0_0100_0000:		fourBit=4'b0110;
	9'b0_1000_0000:		fourBit=4'b0111;
	9'b1_0000_0000:		fourBit=4'b1000;
	default:	fourBit=4'b0000;
   endcase
endmodule