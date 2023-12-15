module collision(rst, clk, start, health_update, user_x, enemy_y);
	input clk; 
	input start; 
	input rst;
	input [7:0] user_x; // 8 bit value keeping track of the user's x position on the vga
	input [6:0] enemy_y; // 7 bit value keeping track of the enemy's y position on the vga

	output reg health_update; 

	always@(posedge clk or negedge rst)
	begin
		if(enemy_y[user_x] == 1'b1)begin
			health_update <= 1'b1;
		end
		else begin
			health_update <= 1'b0;
		end
	end

endmodule
