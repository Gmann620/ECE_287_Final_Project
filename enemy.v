// ENEMY 

module enemy( 

input rst, 
input clk,
input collision,

output reg [9:0] enemy_y,
output reg exists
); 

reg [24:0] counter; 

always @ (posedge clk or negedge rst)
begin 
	if (!rst)  
	begin
	counter = 1'd0;
		/*exists <= 1'b1; 
		enemy_y <= 10'd0; */
		if (exists && !collision) 
		begin	
			//counter = 1'd0; 
			if (counter == 25'd40000000) begin 
				enemy_y <= enemy_y + 10'd1;
				counter <= 25'd0;
			end else begin 
				counter <= counter + 1'd1;
			end
		end	
	
	end 
	else begin 
	exists <= 1'b1; 
		enemy_y <= 10'd0;
	end 
		
end 

endmodule 