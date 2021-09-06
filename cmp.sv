module cmp(	input logic [8:0] A,
				output logic i_lt_256);
always_comb i_lt_256=A<256;
endmodule