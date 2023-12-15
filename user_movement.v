module user_movement(clk, rst, right, left, start, x_val); 
input clk;
input rst; 
input right, left;  
input start; 

Output reg [7:0] x_val; 

always @ (posedge clk or negedge rst)
begin 
	if (start) 
		x_val <= 8'b0;
	else if (right) 
		x_val <= (x_val < 8'd160) ? x_val + 1'b1: 8'd160;
	else if (left) 
		x_val <= (x_val > 8'd0)  ? x_val - 1'b1 : 8'd0;
	else // both switches are on or of (default) 
		x_val <= 8'b0; 
end 
endmodule 