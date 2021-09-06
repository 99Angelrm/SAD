module sum(	input logic sum_ld,sum_clr,clk,
				input logic [31:0] sum_in,
				output logic [31:0]sum_out
				);
		always_ff @(posedge clk or posedge sum_clr)begin
		if(sum_clr) sum_out = 0;
		else if(sum_ld)sum_out=sum_in;
		end
			
endmodule