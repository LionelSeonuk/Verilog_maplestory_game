module meteor_display

(output [11:0] rgb         ,
output        on          ,
output        maple_hit2   ,
input         clk         ,
input         rst         ,
input  [9:0]  xg          ,
input  [9:0]  yg          ,
input         frame_tick ,
input  [9:0]  maple_left  ,
input  [9:0]  maple_top
);

wire [11:0] meteor1_rgb, meteor2_rgb, meteor3_rgb;
wire meteor1_on, meteor2_on, meteor3_on;
wire [9:0] meteor1_left, meteor2_left, meteor3_left;
wire [9:0] meteor1_top, meteor2_top, meteor3_top;
wire [9:0] meteor1_right, meteor2_right, meteor3_right;
wire [9:0] meteor1_bottom, meteor2_bottom, meteor3_bottom;


parameter WIDTH = 39, HEIGHT = 39;
parameter WIDTH_M =41, HEIGHT_M = 49; //Maple size


meteor #(
    .METEOR_INITIAL_LEFT (300),
    .METEOR_INITIAL_TOP  (100),
    .METEOR_INITIAL_MOVE  (0)
)
meteor1(     
        .rgb        (meteor1_rgb          ), 
        .on         (meteor1_on           ), 
        .meteor_left(meteor1_left         ), 
        .meteor_top (meteor1_top          ), 
        .clk        (clk                  ), 
        .rst        (rst), 
        .frame_tick (frame_tick           ), 
        .xg         (xg                   ), 
        .yg         (yg                   )
);

meteor #(
    .METEOR_INITIAL_LEFT (400),
    .METEOR_INITIAL_TOP  (100),
    .METEOR_INITIAL_MOVE  (0)
)
meteor2(     
        .rgb        (meteor2_rgb          ), 
        .on         (meteor2_on           ), 
        .meteor_left(meteor2_left         ), 
        .meteor_top (meteor2_top          ), 
        .clk        (clk ), 
        .rst        (rst), 
        .frame_tick (frame_tick           ), 
        .xg         (xg                   ), 
        .yg         (yg                   )
);

meteor #(
    .METEOR_INITIAL_LEFT (500),
    .METEOR_INITIAL_TOP  (100),
    .METEOR_INITIAL_MOVE  (0)
)
meteor3(     
        .rgb        (meteor3_rgb          ), 
        .on         (meteor3_on           ), 
        .meteor_left(meteor3_left         ), 
        .meteor_top (meteor3_top          ), 
        .clk        (clk                  ), 
        .rst        (rst), 
        .frame_tick (frame_tick           ), 
        .xg         (xg                   ), 
        .yg         (yg                   )
);

assign on = meteor1_on || meteor2_on || meteor3_on;

assign rgb = (meteor1_on) ? meteor1_rgb :
             (meteor2_on) ? meteor2_rgb :
             (meteor3_on) ? meteor3_rgb :
	          12'h000;

assign meteor1_right = meteor1_left + WIDTH;
assign meteor1_bottom = meteor1_top + HEIGHT;

assign meteor2_right = meteor2_left + WIDTH;
assign meteor2_bottom = meteor2_top + HEIGHT;


assign meteor3_right = meteor3_left + WIDTH;
assign meteor3_bottom = meteor3_top + HEIGHT;

wire [9:0] maple_right, maple_bottom;
assign maple_right = maple_left + WIDTH_M;
assign maple_bottom = maple_top + HEIGHT_M;

reg stable_d;
wire maple_hit_0;

always @(posedge clk or posedge rst) begin
    if (rst) stable_d <= 1'b0;
    else stable_d <= maple_hit_0;
end

assign maple_hit2 = maple_hit_0 & (~stable_d);

// meteor_hit logic
assign maple_hit_0 = ((meteor1_right >= maple_left && meteor1_left <= maple_right && meteor1_bottom >= maple_top && meteor1_top <= maple_bottom) ||
                      (meteor2_right >= maple_left && meteor2_left <= maple_right && meteor2_bottom >= maple_top && meteor2_top <= maple_bottom) ||
                      (meteor3_right >= maple_left && meteor3_left <= maple_right && meteor3_bottom >= maple_top && meteor3_top <= maple_bottom))? 1 : 0;

endmodule

