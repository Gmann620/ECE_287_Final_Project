module health(health, clk, rst, health_update, start);
	input clk, rst; 
	input health_update; 
	input start; 
	output reg health;

always @ (posedge clk or negedge rst) 
begin
	/*if (!start) begin
		health <= 1'b0;
	end else begin 
		health <= 1'b1;
		if (health_update == 1'b1) begin 
			health <= 1'b0;	
		end 
	end*/

	if (!rst) begin
				health <= 1'b1;
		if (health_update == 1'b1) begin 
			health <= 1'b0;
	end else begin 
		health <= 1'b0;	
		end 
	end
	
end 
endmodule 