module monsterskill_display

(output [11:0] rgb         ,
output        on          ,
output        maple_hit1   ,
input         clk         ,
input         rst         ,
input  [9:0]  xg          ,
input  [9:0]  yg          ,
input         frame_tick ,
input  [9:0]  maple_left  ,
input  [9:0]  maple_top
);


parameter WIDTH = 14, HEIGHT = 19;
parameter WIDTH_M =44, HEIGHT_M = 48; //Maple size

wire [9:0] monsterskill_left,monsterskill_top,monsterskill_bottom,monsterskill_right;

fireball #(
    .FIREBALL_INITIAL_LEFT (600),
    .FIREBALL_INITIAL_TOP  (360),
    .FIREBALL_INITIAL_MOVE  (0)
)
fireball(     
        .rgb        (rgb          ), 
        .on         (on           ), 
        .fireball_left(monsterskill_left         ), 
        .fireball_top (monsterskill_top          ), 
        .clk        (clk                  ), 
        .rst        (rst), 
        .frame_tick (frame_tick           ), 
        .xg         (xg                   ), 
        .yg         (yg                   )
);


wire [9:0] maple_right, maple_bottom;
assign maple_right = maple_left + WIDTH_M;
assign maple_bottom = maple_top + HEIGHT_M;

reg stable_d;
wire maple_hit_0;

always @(posedge clk or posedge rst) begin
    if (rst) stable_d <= 1'b0;
    else stable_d <= maple_hit_0;
end

assign maple_hit1 = maple_hit_0 & (~stable_d);

// meteor_hit logic
assign maple_hit_0 = (monsterskill_left <= maple_right && monsterskill_top <= maple_bottom)? 1 : 0;

endmodule

