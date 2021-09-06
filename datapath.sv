module datapath(	input logic [7:0]A_data,B_data,
						input i_inc,i_clr,sum_ld,sum_clr,sadreg_ld,sadreg_clr,clk,
						output logic [31:0] sad,
						output logic [8:0] AB_addr,
						output i_lt_256);
						
						logic [7:0] resta,ABS;
						logic [31:0] sum_in,sum_out;
						logic [8:0]AB_addr_temp;
		resta RESTA(
		.A_data(A_data),
		.B_data(B_data),
		.resta(resta));
		ABS abs(
		.resta(resta),
		.ABS(ABS)
		);
		mas MAS(
		.ABS(ABS),
		.sum_in(sum_out),
		.sum_out(sum_in)
		);
		sum SUM(
		.sum_ld(sum_ld),
		.sum_clr(sum_clr),
		.clk(clk),
		.sum_in(sum_in),
		.sum_out(sum_out)
		);
		sadreg SADREG(
		.sadreg_ld(sadreg_ld),
		.sadreg_clr(sadreg_clr),
		.clk(clk),
		.sadreg_in(sum_out),
		.sadreg_out(sad)
		);
		i I(
		.i_inc(i_inc),
		.i_clr(i_clr),
		.clk(clk),
		.AB_addr(AB_addr_temp));
		cmp CMP(
		.A(AB_addr_temp),
		.i_lt_256(i_lt_256));
		
		always_comb AB_addr=AB_addr_temp;
		
		
endmodule