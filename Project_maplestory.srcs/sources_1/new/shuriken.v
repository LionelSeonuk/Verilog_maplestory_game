module shuriken
(
    input clk,shuriken_fire,
    input  rst,maple_direction,
    input  [9:0]  xg  ,
    input  [9:0]  yg ,
    input  frame_tick ,     
    output [11:0] rgb,
    output on  , 
    output [9:0]  shuriken_left,
    output [9:0]  shuriken_top,
    input [9:0] maple_left
);

parameter RIGHT_END = 639, BOTTOM_END = 479; 
parameter WIDTH = 16, HEIGHT = 19;

wire [9:0] left, right;
wire [9:0] top, bottom;
assign right = left + WIDTH;
assign bottom = top + HEIGHT;

// On condition
assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom) && (rgb != 12'h000); 

wire [5:0] x_rom;
wire [5:0] y_rom;
assign x_rom = xg - left;
assign y_rom = yg - top;

skill1_rom skill1_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb));
reg [9:0] c_left, n_left;
reg [9:0] c_top, n_top;


always @(posedge clk or posedge rst) begin
    if(rst) begin
        c_left <= maple_left;
        c_top <= 345;
    end else begin
            c_left <= n_left;
            c_top <= n_top;
    end
end

always @(*) begin
    if (frame_tick == 1 && shuriken_fire ) begin
            n_left = (maple_direction == 0) ? c_left - 3: c_left + 3;
            n_top = c_top;
    end else begin
        n_left = c_left;
        n_top = c_top;
    end
end

assign left = c_left;
assign top = c_top;


assign shuriken_left=left;
assign shuriken_top=top;

endmodule