// PROJECTILE 

module projectile(
input rst, 
input clk, 
input shoot, 
input [9:0]playerx,
input has_collided,

output reg [9:0] projx, 
output reg [9:0] projy,
output reg exists); 

reg creation_flag; 

always @ (posedge clk or negedge rst) 
begin 

	if (!rst) begin 
		//exists = 1'b0; 
		//projx = 10'd0; 
		//projy = 10'd0;
	
		if (shoot) begin 
			creation_flag = 1'b1; 
		end else  begin 
			creation_flag = 1'b0;
		
		
			if (creation_flag && !exists) begin 
				exists = 1'b1; 
				projx = playerx; 
				projy = 10'd448; 
			end 
	
			else if ( exists && projy == 10'd0) begin 
				exists = 1'b0; 
			end else if (exists)  begin 
				projy = projy - 10'd4;
			end
		end 
	end  else begin
	
	   exists = 1'b0; 
		projx = 10'd0; 
		projy = 10'd0; 
	
		/*if (shoot)  
			creation_flag = 1'b1; 
		else  
			creation_flag = 1'b0;
		
		
			if (creation_flag && !exists) begin 
				exists = 1'b1; 
				projx = playerx + 10'd30; 
				projy = 10'd448; 
			end 
	
			else if ( exists && projy == 10'd0) 
				exists = 1'b0; 
			else if (exists)  
				projy = projy - 10'd4;*/ 
	end 

end 
endmodule 