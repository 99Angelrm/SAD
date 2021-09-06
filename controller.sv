typedef enum logic [2:0]
{
	S0 = 3'b000,
	S1 = 3'b001, 
	S2 = 3'b010,
	S3 = 3'b011,
	S4 = 3'b100,
	ERROR = 3'bXXX

} t_cntrl_fsm_state;

module controller(input logic clk,
						input logic rst,
						input logic go,
						input logic i_lt_256,		
						output logic AB_rd,
						output logic i_inc,
						output logic i_clr,
						output logic sum_ld,
						output logic sum_clr,
						output logic sadreg_ld,
						output logic sadreg_clr
						);				
t_cntrl_fsm_state	state;   	
t_cntrl_fsm_state	nxtstate;

// FSM COMBINATORIAL LOGIC;   STATE TRANSITION LOGIC
	always_comb begin 
		case(state)
			S0: nxtstate = go ? S1:S0;
			S1: nxtstate = S2;
			S2: nxtstate = i_lt_256 ? S3 : S4;
			S3: nxtstate = S2;
			S4: nxtstate = S0;
			default: nxtstate=S0;
		endcase
	end

// FSM STATE REGISTER, SEQUENTIAL LOGIC
	always_ff @(posedge clk)
			state <= (rst) ? S0 : nxtstate;
			
	always_comb begin
		sum_clr = (state==S1);
		sadreg_clr=(state==S1);
		i_clr = (state==S1);
		sum_ld= (state==S3);
		AB_rd=(state==S3);
		i_inc=(state==S3);
		sadreg_ld=(state==S3||state==S4);
	end
endmodule
	