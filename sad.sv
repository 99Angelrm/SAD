module sad(	input go,clk,rst,
				input logic [7:0] A_data,B_data,
				output AB_rd,
				output logic [8:0] AB_addr,
				output logic [31:0] sad);
			logic i_lt_256,i_inc,i_clr, sum_ld, sum_clr, sadreg_ld,sadreg_clr;
				
		controller CONTROLLER(
		.clk(clk),
		.rst(rst),
		.go(go),
		.i_lt_256(i_lt_256),		
		.AB_rd(AB_rd),
		.i_inc(i_inc),
		.i_clr(i_clr),
		.sum_ld(sum_ld),
		.sum_clr(sum_clr),
		.sadreg_ld(sadreg_ld),
		.sadreg_clr(sadreg_clr)
		);
		datapath DATAPATH(
		.A_data(A_data),
		.B_data(B_data),
		.i_inc(i_inc),
		.i_clr(i_clr),
		.sum_ld(sum_ld),
		.sum_clr(sum_clr),
		.sadreg_ld(sadreg_ld),
		.sadreg_clr(sadreg_clr),
		.clk(clk),
		.sad(sad),
		.AB_addr(AB_addr),
		.i_lt_256(i_lt_256)
		);

endmodule