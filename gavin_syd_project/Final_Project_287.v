module Final_Project_287(
	input clk,        // ???MHz
	input rst,        // Active High
	input start,      // Active High
	input [2:0] look, // Player look direction
	input shoot,      // Player shoot input
	output home_disp, // Toggle home display
	output game_disp, // Toggle game display
	output end_disp); // Toggle end display
	
	
	/* FSM State Initialization */
	reg [1:0] S, NS;
	parameter HOME = 2'd0, GAME = 2'd1, END = 2'd2;
	
	/* Module Initialization */
	//projectile proj(.clk(clk), .rst(rst), ...);
	
	//vga_driver vga(.clock(vga_clk), .reset(rst), .color_in(color_input), 
	//					  .next_x(next_x), .next_y(next_y), .HSYNC(hsync), .VSYNC(vsync), 
	//               .RED(red), .GREEN(green), .BLUE(blue), .SYNC(sync), .clk(clk), .BLANK(blank));
	
	
	/* VGA Regs and Wires */
	reg vga_clk;
	reg [7:0] color_input;
	reg [9:0] next_x, next_y;
	wire HSYNC, VSYNC;
	reg [7:0] RED, GREEN, BLUE;
	reg SYNC, BLANK;
	
	
	/* Extra Regs and Wires */
	
	
	
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
			HOME: //if start = 1 stay at HOME, else go to GAME
			begin
				if (start == 1'b1)
				begin
					NS = GAME;
				end
				else
				begin
					NS = HOME;
				end
			end //end HOME
			
			GAME: //if start = 1 go to END, else go to HOME
			begin
				if (start == 1'b1)
				begin
					NS = END;
				end
				else
				begin
					NS = HOME;
				end
			end //end GAME
			
			END: //if start = 1 stay at END, else go to HOME
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
				
				GAME:
				begin
					
				end //end GAME
				
				END:
				begin
					
				end //end END
			endcase
		end //end rst else
	end
	
	
endmodule 