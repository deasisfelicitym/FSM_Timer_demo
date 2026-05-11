module fsm_timer_demo(out,timer,state,t,clk,ovr,rst_n);

 //ports
 input      	  t;
 input      	  clk;
 input            ovr
 input      	  rst_n;
 output reg 	  out;
 output reg [3.0] timer;
 output reg [3:0] state;

 // state assignments
 localparam [3:0] S0 = 4'b0000;
 localparam [3:0] S1 = 4'b0001;
 localparam [3:0] S2 = 4'b0010;
 localparam [3:0] S3 = 4'b0011;
 reg [3:0] nxt;
 reg [3:0] pre;

 // input block
 always @(pre,nxt)begin
	if (ovr) begin
           nxt = S3;
	end
	else begin
	   case (pre)
		
		S0: nxt = S1;

		S1: if (t == 4'd3) nxt = S2;
		    else nxt = S1;

		S2: if (t == 4'd3) nxt = S0;
		    else nxt = S2;

		S3: nxt = S0;
		default: nxt = S0;
	  endcase
       end


endmodule