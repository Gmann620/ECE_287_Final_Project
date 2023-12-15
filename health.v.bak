module health(health, clk, rst, health_update, start);
	input clk, rst; 
	input health_update; 
	input start; 
	output reg health;

always @ (posedge clk or negedge rst) 
	if (start) 
		health <= 1'b1;
	if (health_update) 
		health <= 1'b0;	
end 
endmodule 