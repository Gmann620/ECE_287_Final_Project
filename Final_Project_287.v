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
	output game_end				// Game end signal
	); 

/* Module Initialization */
//projectile_movement proj(.clk(clk), 
//									.rst(rst),
//									.
//									);

//user_movement my_play_movement(.clk(clk),
//											.rst(rst),
//				  				 			.right(look_right),
//				  				 			.left(look_left),
//				  				 			.startGame(start),
//				  				 			.x_val(user_x)
//								 			);

//health my_health(.clk(clk),
//						 .rst(rst),
//					    .healthUp(),
//					    .startGame(start),
//					    .health(health)
//					    );

//enemy_movement my_en1_movement(.clk(clk),
//											.rst(rst),
//											.startGame(start),
//											.y_val(enemy_1_y),
//											);
									
//enemy_movement my_en2_movement(.clk(clk),
//											.rst(rst),
//											.startGame(start),
//											.y_val(enemy_2_y),
//											);
								
//enemy_movement my_en3_movement(.clk(clk),
//											.rst(rst),
//											.startGame(start),
//											.y_val(enemy_3_y),
//											);

//collision my_collision(.clk(clk),
//							  	 .startGame(start),
//							    .
//							    );

vga_driver vga(.clock(clk), //maybe change clk for this?? 
					.reset(rst), 
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
reg [7:0] color_input;		//RGB value of current pixel
wire [9:0] next_x, next_y; //Coords of next pixel

/* Module Regs and Wires */


/* Game Logic Regs and Wires */
//wire [:0] health;
//wire [:0] weapon_cooldown;
//wire [:0] score;

//wire [:0] user_x;

//wire [:0] enemy_1_x, enemy_2_x, enemy_3_x;
//wire [:0] enemy_1_y, enemy_2_y, enemy_3_y;

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
			if (game_end == 1'b1)
			begin
				NS = END;
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
		
	end
	else
	begin
		case(S)
			HOME:
			begin
				
			end //end HOME
			
			UPDATE:
			begin
				
			end //end UPDATE
			
			END:
			begin
				
			end //end END
		endcase
	end
end
	
endmodule 