module resta(input logic [7:0] A_data,B_data,
				 output logic[7:0] resta);

			always_comb resta=A_data-B_data;

endmodule