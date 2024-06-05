module skill_display(
    input clk,
    input  rst,
    input  [9:0]  xg  ,
    input  [9:0]  yg ,
    input  frame_tick ,     
    output [11:0] rgb,
    output on  ,
    input [9:0] monster_left,maple_left,
    output monster_hit,
    input btn
);
 
parameter WIDTH = 19, HEIGHT = 17;
parameter WIDTH_M =102, HEIGHT_M = 79;

wire [9:0] skill_left,skill_top,skill_bottom,skill_right;
bullet(     
        .rgb        (rgb          ), 
        .on         (on           ), 
        .bullet_left(skill_left         ), 
        .bullet_top (skill_top          ), 
        .clk        (clk                  ), 
        .rst        (rst), 
        .btn        (btn),
        .frame_tick (frame_tick           ), 
        .xg         (xg                   ), 
        .yg         (yg                   ),
        .maple_left(maple_left)
);
wire [9:0] monster_right;
assign monster_right = monster_left + WIDTH_M;

assign skill_right = skill_left + WIDTH;

reg stable_d;
wire monster_hit_0;

always @(posedge clk or posedge rst) begin
    if (rst) stable_d <= 1'b0;
    else stable_d <= monster_hit_0;
end

assign monster_hit = monster_hit_0 & (~stable_d);

// meteor_hit logic
assign monster_hit_0 = (skill_right >= monster_left)? 1 : 0;

endmodule