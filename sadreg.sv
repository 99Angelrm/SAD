module sadreg(	input logic sadreg_ld,sadreg_clr,clk,
				input logic [31:0] sadreg_in,
				output logic [31:0]sadreg_out
				);
		always_ff @(posedge clk or posedge sadreg_clr)begin
		if(sadreg_clr) sadreg_out = 0;
		else if(sadreg_ld)sadreg_out=sadreg_in;
		end
			
endmodule