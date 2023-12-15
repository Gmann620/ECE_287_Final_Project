module Final_Project_287(
	input clk,        			// ???MHz
	input rst,        			// Active High
	input start,      			// Active High
	input [2:0] look, 			// Player look direction
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
//projectile proj(.clk(clk), .rst(rst), ...);

vga_driver vga(.clock(vga_clk), 
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
					.clk(clk), 
					.blank(vga_blank)
					);


/* VGA Regs and Wires */
reg [7:0] color_input;
wire [9:0] next_x, next_y;

/* Module Regs and Wires */


/* Game Logic Regs and Wires */
//wire [:0] health;
//wire [:0] weapon_cooldown;
//wire [:0] score;

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
	//case(S)
	//	
	//endcase
end


/* Variable Update/Processing Block */
always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
	begin
		
	end
	else
	begin
		//case(S)
		//	
		//endcase
	end
end
	
	
endmodule 