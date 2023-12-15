module Final_Project_287(
	input clk,        			// 50MHz
	input rst,        			// Active High
	input start,      			// Active High
	input look_left, 				// Player looks left
	input look_right,				// Player look's right
	input shoot,      			// Player shoot input
	output vga_clk,				// Clock for VGA
	output wire hsync, vsync,	// Horizontal and Vertical VGA sync
	output vga_sync,				// VGA sync
	output [7:0] RED,				// VGA red
	output [7:0] GREEN,			// VGA green
	output [7:0] BLUE,			// VGA blue
	output vga_blank,				// VGA blank
	output reg game_end				// Game end signal
	); 


	wire collision; 
	wire exists; 
/* Module Initialization */
projectile my_proj_movement(.rst(rst), 
													.clk(clk),
													.shoot(shoot),
													.playerx(user_x),
													.has_collided(collision),
													.projx(projectile_x),
													.projy(projectile_y),
													.exists(projectile_exists)
													);

movement my_movement(.clk(clk),
											.rst(rst),
				  				 			.right(look_right),
				  				 			.left(look_left),
				  				 			.start(start),
				  				 			.x_val(user_x)
								 			);

health my_health(.health(health),
						 .clk(clk),
						 .rst(rst),
					    .health_update(health_update),
					    .start(start),
					    );

enemy my_en1_movement(.clk(clk),
											.rst(rst),
											.collision(collision),
											.exists(exists),
											.enemy_y(enemy_1_y),
											);
									
enemy my_en2_movement(.clk(clk),
											.rst(rst),
											.collision(collision), 
											.exists(exists),
											.enemy_y(enemy_2_y),
											);
								
enemy my_en3_movement(.clk(clk),
											.rst(rst),
											.collision(collision), 
											.exists(exists),
											.enemy_y(enemy_3_y),
											);

collision my_collision(.clk(clk),
							  	 			.start(start),
							    			.rst(rst), 
											.enemy_1_y(enemy_1_y),
											.enemy_2_y(enemy_2_y),
											.enemy_3_y(enemy_3_y),
							    			);

clk_halfer my_halfer(.clk(clk),
							.half_clk(clk_25MHz)
							);
							
draw_logic my_draw(.clk(clk),
						 .rst(rst),
						 .start(start),
						 .user_x(user_x),
						 .user_y(user_y),
						 .enemy_1_x(enemy_1_x),
						 .enemy_2_x(enemy_2_x),
						 .enemy_3_x(enemy_3_x),
						 .enemy_1_y(enemy_1_y),
						 .enemy_2_y(enemy_2_y),
						 .enemy_3_y(enemy_3_y),
						 .projectile_x(projectile_x),
						 .projectile_y(projectile_y),
						 .next_x(next_x),
						 .next_y(next_y),
						 .color_out(color_input)
						 );

vga_driver vga(.clock(clk_25MHz), //resolution 640x480
					.reset(!rst), 
					.color_in(color_input), 
					.next_x(next_x), 
					.next_y(next_y), 
					.hsync(hsync), 
					.vsync(vsync), 
               .red(RED), 
					.green(GREEN), 
					.blue(BLUE), 
					.sync(vga_sync), 
					.clk(vga_clk), 
					.blank(vga_blank)
					);

/* VGA Regs and Wires */
wire clk_25MHz;					//25MHz clock for vga
reg [7:0] color_input;			//RGB value of current pixel
wire [9:0] next_x, next_y; 	//Coords of next pixel

/* Module Regs and Wires */
wire health_update;

/* Game Logic Regs and Wires */
wire health;
wire [23:0] weapon_cooldown;
wire [15:0] score;

wire [7:0] user_x;
wire [6:0] user_y = 7'd119;

wire [7:0] enemy_1_x, enemy_2_x, enemy_3_x;
wire [7:0] enemy_1_y, enemy_2_y, enemy_3_y;

wire [7:0] projectile_x, projectile_y;
wire projectile_exists;

/* State Parameters */
reg [2:0] S, NS;
parameter HOME = 3'd0, UPDATE = 3'd1, END = 3'd2;

/* State Update Block */
always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
	begin
		S <= HOME;
	end
	else
	begin
		S <= NS;
	end
end


/* State Transition Block */
always@(*)
begin
	case(S)
		HOME:
		begin
			if (start == 1'b1)
			begin
				NS = UPDATE;
			end
			else
			begin
				NS = HOME;
			end
		end //end HOME
		
		UPDATE:
		begin
			if (health == 1'b0)
			begin
				NS = END;
			end
			else if (start == 1'b0)
			begin
				NS = HOME;
			end
			else
			begin
				NS = UPDATE;
			end
		end //end UPDATE
		
		END:
		begin
			if (start == 1'b1)
			begin
				NS = END;
			end
			else
			begin
				NS = HOME;
			end
		end //end END
	endcase
end


/* Variable Update/Processing Block */
always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
	begin
		game_end <= 1'b0;
		//color_input <= 8'b11111111;
	end
	else
	begin
		case(S)
			HOME:
			begin
				game_end <= 1'b0;
				//color_input <= 8'b11111111;
				
			end //end HOME
			
			UPDATE:
			begin
				
			end //end UPDATE
			
			END:
			begin
				game_end <= 1'b1;
				//color_input <= 8'b11100000;
				
			end //end END
		endcase
	end
end
	
endmodule 