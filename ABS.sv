module ABS(	input logic [7:0] resta,
				output logic [7:0] ABS);
always_comb ABS = (resta[7]==1'b1) ? ~resta+1 :resta;

endmodule