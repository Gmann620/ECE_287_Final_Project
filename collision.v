module collision_handler(enem_grid, clk, start, health_update, user_x, user_y, enemy_x, enemy_y);
	input [160*120-1:0]enem_grid; // 2D reigster grid representing where the bullets are on the screen
	input clock; // default 50mhz clock on de2 board
	input startGameEn; // FSM reset signal to reset everything 
	input [7:0] user_x; // 8 bit value keeping track of the user's x position on the vga
	input [6:0] user_y; // 7 bit value keeping track of the user's y position on the vga
	input [7:0] enemy_x; // 8 bit value keeping track of the enemy's x position on the vga
	input [6:0] enemy_y; // 7 bit value keeping track of the enemy's y position on the vga

	output reg health_update; 

	always@(posedge clk or negedge rst)
	begin
		if(enem_grid[120*user_x+user_y] == 1'b1)begin
			health_update <= 1'b1;
		end
		else begin
			health_update <= 1'b0;
		end
	end

endmodule
