module fireball
#(
    parameter FIREBALL_INITIAL_LEFT = 600,
    parameter FIREBALL_INITIAL_TOP = 350,
    parameter FIREBALL_INITIAL_MOVE = 0
)
(
    input clk,
    input  rst,
    input  [9:0]  xg  ,
    input  [9:0]  yg ,
    input  frame_tick ,     
    output [11:0] rgb,
    output on  ,
    output [9:0]  fireball_left,
    output [9:0]  fireball_top
);

parameter RIGHT_END = 639, BOTTOM_END = 479; 
parameter WIDTH = 33, HEIGHT = 19;

// Varible left, top fixed right, bottom
wire [9:0] left, right;
wire [9:0] top, bottom;
assign right = left + WIDTH;
assign bottom = top + HEIGHT;

// On condition
assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom) && (rgb != 12'h000); 

wire [5:0] x_rom;
wire [4:0] y_rom;
assign x_rom = xg - left;
assign y_rom = yg - top;
monsterskil12_rom monsterskil12_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb));


reg [9:0] c_left, n_left;
reg [9:0] c_top, n_top;
parameter COUNT = 25175000;
reg [26:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
    end
    else if (counter == COUNT) begin
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
    end 
end

wire tick = (counter == COUNT);

always @(*) begin
    if (frame_tick==1) begin
        if (tick) begin
            n_left = FIREBALL_INITIAL_LEFT;
            n_top = FIREBALL_INITIAL_TOP;
        end
        else begin
            n_left = (c_left > 3) ? c_left - 3 : FIREBALL_INITIAL_LEFT;
            n_top = c_top;
        end
    end
    else begin
        n_left = c_left;
        n_top = c_top;
    end
end

always @(posedge clk or posedge rst) begin
    if(rst) begin
        c_left <= FIREBALL_INITIAL_LEFT;
        c_top <= FIREBALL_INITIAL_TOP;
    end else begin
        c_left <= n_left;
        c_top <= n_top;
    end
end

assign left = c_left;
assign top = c_top;


assign fireball_left=left;
assign fireball_top=top;
endmodule
