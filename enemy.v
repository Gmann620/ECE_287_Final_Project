// ENEMY 

module enemy( 

input rst, 
input clk,
input collision,

output reg [9:0] enemy_y,
output reg exists
); 

always @ (posedge clk or negedge rst)
begin 
	if (!rst) 
	begin
		/*exists <= 1'b1; 
		enemy_y <= 10'd0; */
		if (exists && !collision) 
		begin 
			enemy_y <= enemy_y + 10'd10; 
		end	
	
	end 
	else begin 
	exists <= 1'b1; 
		enemy_y <= 10'd0;
	end 
		
end 

endmodule 


