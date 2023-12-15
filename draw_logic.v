module draw_logic(
	input clk,
	input rst,
	input start,
	input [7:0] user_x,
	input [6:0] user_y,
	
	input [7:0] enemy_1_x, 
	input [7:0] enemy_2_x, 
	input [7:0] enemy_3_x,
	
	input [7:0] enemy_1_y, 
	input [7:0] enemy_2_y, 
	input [7:0] enemy_3_y,
	
	input [7:0] projectile_x,
	input [7:0] projectile_y,
	
	input [9:0] next_x,
	input [9:0] next_y,
	
	output reg [7:0]color_out
	);
	
	wire [7:0] black = 8'b00000000;
	wire [7:0] red   = 8'b11100000;
	wire [7:0] blue  = 8'b00000011;
	wire [7:0] green = 8'b00011100;
	
	reg [7:0] next_color = black;
	reg clear = 1'b0;
	
	//resolution 640x480
	always@(posedge clk)
	begin
		if (start == 1'b0)
		begin
			next_color <= black;
			clear <= 1'b1;
		end
		else
		begin
			//due to vga we only know the next pixel to be drawn
			color_out <= next_color;
			
			//set initial screen to black
			if (clear == 1'b1)
			begin
				next_color <= black;
			end
			
			//draw player (circle)
			else if ((next_x - user_x <= 40 && next_x - user_x >= -40) && 
						(next_y - user_y <= 40 && next_y - user_y >= -40))
			begin
				next_color <= green;
			end
			
			//draw projectile (ring)
			else if ((next_x - projectile_x == 20 || next_x - projectile_x == -20) && 
						(next_y - projectile_y == 20 || next_y - projectile_y == -20))
			begin
				next_color <= blue;
			end
			
			//draw enemy1 (circle)
			else if ((next_x - enemy_1_x <= 30 && next_x - enemy_1_x >= -30) && 
						(next_y - enemy_1_x <= 30 && next_y - enemy_1_x >= -30))
			begin
				next_color <= red;
			end
			
			//draw enemy2 (circle)
			else if ((next_x - enemy_2_x <= 30 && next_x - enemy_2_x >= -30) && 
						(next_y - enemy_2_x <= 30 && next_y - enemy_2_x >= -30))
			begin
				next_color <= red;
			end
			
			//draw enemy3 (circle)
			else if ((next_x - enemy_3_x <= 30 && next_x - enemy_3_x >= -30) && 
						(next_y - enemy_3_x <= 30 && next_y - enemy_3_x >= -30))
			begin
				next_color <= red;
			end
			
			//draw blank spaces as black
			else
			begin
				next_color <= black;
			end
			
			
			//when clear is done with the first frame turn off
			if (next_x == 10'd0 && next_y == 10'd0)
			begin
				clear <= 1'b0;
			end
		end
	end
	
endmodule 