module movement(clk, rst, right, left, start, x_val); 
input clk;
input rst; 
input right;
input left;  
input start; 

output reg [7:0] x_val; 

always @ (posedge clk or negedge rst)
begin 


//if(rst) begin
	//x_val <= 8'd300;
//end else begin 
	
if (!rst) 
begin 

	if(right == 1'b1) begin
		x_val <= 8'd400;
		                                                 
	end else if(left == 1'b1) begin
		x_val <= 8'd200;
		                                                  
	end else begin
		x_val <= 8'd300; 
	end 

end else begin 
	x_val <= 8'd300; 

end 


end 
endmodule 
