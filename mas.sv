module mas  (
	input  logic [7:0]	ABS,
	input  logic [31:0]	sum_in,
	output logic [31:0]	sum_out
	);
		
	
	always_comb sum_out=sum_in+{24'd0,ABS};
					
endmodule
