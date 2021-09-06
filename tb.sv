module tb(); 
  
	logic i_inc,i_clr,clk;
	logic [8:0] AB_addr;
	
	i uut(.*);

		
	initial begin
	clk=0;
	i_clr=1;
	i_inc=0;
	#10
	i_clr=0;
	i_inc=1;
	#50
	i_clr=1;
	end
	
	initial begin
	forever #1 clk = ~clk;
	end
	
	
	
endmodule
