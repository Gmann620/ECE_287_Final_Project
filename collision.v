module collision(rst, clk, start, health_update, enemy_1_y, enemy_2_y, enemy_3_y);
	input clk; 
	input start; 
	input rst;
	input [7:0] enemy_1_y;
	input [7:0] enemy_2_y; 
	input [7:0] enemy_3_y; 

	output reg health_update; 

	always@(posedge clk or negedge rst)
	begin
	
	if (!rst) 
	begin 
	
		if(enemy_1_y == 8'd119)begin
			health_update <= 1'b1;
		end
		else if(enemy_2_y == 8'd119)begin
			health_update <= 1'b1;
		end
		else if(enemy_3_y == 8'd119)begin
			health_update <= 1'b1;
		end
		else begin
			health_update <= 1'b0;
		end
	
	end else begin 
	
		health_update <= 1'b0;
	end
end
endmodule
