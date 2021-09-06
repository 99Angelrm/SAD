module i(	input logic i_inc,i_clr,clk,
				output logic [8:0] AB_addr);
			logic [8:0] AB_addr_temp;
		always_ff @(posedge clk or posedge i_clr)begin
		if(i_clr) AB_addr_temp=0;
		else AB_addr_temp=i_inc?AB_addr_temp+1:AB_addr_temp;
		end
		always_comb AB_addr=AB_addr_temp;

endmodule