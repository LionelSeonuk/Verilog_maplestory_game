module bullet(
    input clk,
    input rst,
    input maple_direction,
    input [9:0] xg,
    input [9:0] yg,
    input frame_tick,     
    output [11:0] rgb,
    input btn,
    output on, 
    output  [9:0] bullet_left,
    output  [9:0] bullet_top,
    input [9:0] maple_left
);
wire attack_btn;
assign attack_btn=btn;

reg [9:0] bullet_location;
reg bullet_on;
reg [2:0] bullet_cnt;

parameter RIGHT_END = 639, BOTTOM_END = 479; 
parameter WIDTH = 19, HEIGHT = 17;

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

wire local_rst = (bullet_location >= 550);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        bullet_on <= 0;
        bullet_location <= 0;
        bullet_cnt <= 0;
    end
    else if (frame_tick == 1 && attack_btn && !bullet_on) begin
        bullet_on <= 1;
        bullet_location <= maple_left + 10;
        bullet_cnt <= 0;
    end
    else if (bullet_on && (local_rst || bullet_cnt >= 10)) begin
        bullet_on <= 0;
        bullet_location <= 0;
        bullet_cnt <= 0;
    end
    else if (frame_tick == 1 && bullet_on) begin
        bullet_cnt <= bullet_cnt + 1;
        bullet_location <= bullet_location + 3;
    end
end

assign left = bullet_location;
assign top = 350;

assign bullet_left = bullet_location;
assign bullet_top = 350;

endmodule
