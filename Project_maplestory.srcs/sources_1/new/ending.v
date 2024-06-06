module ending(
input clk, rst,
input [9:0] xg, yg,
output on,
output [11:0] rgb
 );
 
 parameter  width=639, height=479;
 
 wire [9:0] left,right,top,bottom;
 
 assign right = left+width;
 assign bottom = top+height;
 
 assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom) && (rgb != 12'h3b9); 

wire [8:0] x_rom;
wire [7:0] y_rom;
assign x_rom= (xg-left)>>1;
assign y_rom=(yg-top)>>1;

ending_rom ending_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb));

assign left=0;
assign top=0;

endmodule