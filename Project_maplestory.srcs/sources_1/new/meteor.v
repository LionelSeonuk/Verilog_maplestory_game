module meteor
#(
    parameter METEOR_INITIAL_LEFT = 300,
    parameter METEOR_INITIAL_TOP = 100,
    parameter METEOR_INITIAL_MOVE = 0
)
(
    input clk,
    input  rst,
    input  [9:0]  xg  ,
    input  [9:0]  yg ,
    input  frame_tick ,     
    output [11:0] rgb,
    output on  ,
    output [9:0]  meteor_left,
    output [9:0]  meteor_top
);

parameter RIGHT_END = 639, BOTTOM_END = 479; 
parameter WIDTH = 39, HEIGHT = 39;

// Varible left, top fixed right, bottom
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
monsterskill_rom monsterskill_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb));

parameter MOVE = 0;
reg meteor_x_move_st, n_meteor_x_move_st;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        meteor_x_move_st <= METEOR_INITIAL_MOVE;
    end else begin
        meteor_x_move_st <= n_meteor_x_move_st;
    end
end

always @(*) begin
    case(meteor_x_move_st)
        MOVE: n_meteor_x_move_st =  MOVE;
        default: n_meteor_x_move_st = MOVE;
    endcase
end

reg [9:0] c_left, n_left;
reg [9:0] c_top, n_top;

wire local_rst = (c_top >= 346);

always @(*) begin
    if (frame_tick==1 && (meteor_x_move_st == MOVE)) begin
        n_left = local_rst ? METEOR_INITIAL_LEFT : c_left - 1;
        n_top = local_rst ? METEOR_INITIAL_TOP : c_top + 1;
    end else begin
        n_left = c_left;
        n_top = c_top;
    end
end


always @(posedge clk or posedge rst) begin
    if(rst) begin
        c_left <= METEOR_INITIAL_LEFT;
        c_top <= METEOR_INITIAL_TOP;
    end else begin
        c_left <= n_left;
        c_top <= n_top;
    end
end

assign left = c_left;
assign top = c_top;


assign meteor_left=left;
assign meteor_top=top;
endmodule
