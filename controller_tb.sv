module controller_tb(); 
  
	logic go;
	logic rst;
	logic clk;
	logic i_lt_256;		
	logic AB_rd;
	logic i_inc;
	logic i_clr;
	logic sum_ld;
	logic sum_clr;
	logic sadreg_ld;
	logic sadreg_clr;
	
	
	controller utt(.*);
	initial begin
	clk=0;
	rst=1;
	#10
	go=1'b1;
	#0
	rst = 0;
	#10
	i_lt_256=1'b1;

	
	end
	
	initial begin
	forever #5 clk  = ~clk;
	end
	
	
endmodule
