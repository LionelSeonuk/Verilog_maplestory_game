`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/02 00:05:07
// Design Name: 
// Module Name: maplestory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module maplestory(
 output [11:0] rgb,
 input  [9:0]  x,y,
 input [3:0] btn,btn_pulse,
 input clk, rst,
 input  [4:0]  key,key_pulse 
 );
//clk_wiz_0 clk_inst (clk, reset_poweron, locked, clk_100mhz); 
//assign rst = reset_poweron | (~locked); 
 wire [11:0] maple_rgb;
 wire maple_on,monster_hit,skill_on;
 wire [9:0] maple_left,maple_top;
 wire frame_tick;
 
 maple_display maple_display_inst(.rgb(maple_rgb),.on(maple_on),.frame_tick(frame_tick),.maple_left(maple_left),.maple_top(maple_top),.btn(btn[3:1])
 ,.clk(clk),.rst(rst||not_play_rst),.key(key),.xg(x),.yg(y),.c_maple_image_direction_st(c_maple_image_direction_st),.shuriken_fire(shuriken_fire));
 assign frame_tick = (y==479 && x==639)? 1 : 0;
 wire [11:0] monster_rgb;
 wire monster_on;
 wire maple_hit1,maple_hit2,monsterskill_on;
 wire [9:0] monster_left,monster_top;
 
 monster_display monster_display_inst(.rgb(monster_rgb),.on(monster_on),.frame_tick(frame_tick),.monster_left(monster_left),.monster_top(monster_top)
 ,.clk(clk),.rst(rst||not_play_rst),.xg(x),.yg(y),.maple_hit1(maple_hit1),.maple_left(maple_left),.maple_top(maple_top));
 
 wire [11:0] meteor_rgb;
 wire meteor_on;
 
 meteor_display meteor_display_inst(.rgb(meteor_rgb),.on(meteor_on),.frame_tick(frame_tick),.clk(clk)
 ,.rst(rst||not_play_rst),.xg(x),.yg(y),.maple_hit2(maple_hit2),.maple_left(maple_left),.maple_top(maple_top));
 
 wire [11:0] skill_rgb;
 skill_display skill_display_inst(.rgb(skill_rgb),.on(skill_on),.frame_tick(frame_tick),.clk(clk),.maple_left(maple_left)
,.rst(rst||not_play_rst),.xg(x),.yg(y),.monster_hit(monster_hit),.monster_left(monster_left),.shuriken_fire(shuriken_fire),.maple_direction(c_maple_image_direction_st));
 
 wire [11:0] monsterskill_rgb;

monsterskill_display monsterskill_display_inst (.rgb(monsterskill_rgb),.on(monsterskill_on),.frame_tick(frame_tick),.clk(clk),.rst(rst || not_play_rst),.xg(x),.yg(y),.maple_hit1(maple_hit1),.maple_left(maple_left),.maple_top(maple_top));

 
 wire [11:0] intro_rgb;
 wire intro_on;
 intro_display intro_display_inst(.rgb(intro_rgb),.on(intro_on),.clk(clk),.rst(rst),.xg(x),.yg(y));
 
wire [11:0] background_rgb;
 wire background_on;
 background_display background_display_inst(.rgb(background_rgb),.on(background_on),.clk(clk),.rst(rst),.xg(x),.yg(y));
 
 wire [11:0] game_over_rgb;
 wire game_over_on;
game_over game_over_inst(.rgb(game_over_rgb),.on(game_over_on),.clk(clk),.rst(rst),.xg(x),.yg(y));

 wire [11:0] ending_rgb;
 wire ending_on;
ending ending_inst(.rgb(ending_rgb),.on(ending_on),.clk(clk),.rst(rst),.xg(x),.yg(y));

wire [11:0] text_rgb1, text_rgb2;
wire text_on1, text_on2;
text_display text_display_inst(.rgb(text_rgb1),.m_rgb(text_rgb2),.on(text_on1),.m_on(text_on2),.game_over(game_over),.ending(ending),.clk(clk),.rst(rst||not_play_rst)
,.x(x),.y(y),.c_game_st(c_game_st),.maple_hit1(maple_hit1),.maple_hit2(maple_hit2),.monster_hit(monster_hit));



parameter intro_st=0,play_st=1,gameover_st=2,ending_st=3;
 
reg [1:0] c_game_st, n_game_st;
//start btn=> key_pulse==5'h10
always @(posedge clk or posedge rst) begin
    if(rst) begin
        c_game_st <= intro_st;
    end else begin
        c_game_st <= n_game_st;
    end
end

wire ending,game_over;

always @(*) begin
    case(c_game_st)
        intro_st:n_game_st=(key_pulse==5'h10)? play_st:intro_st;
        play_st:n_game_st= (game_over)? gameover_st:(ending)? ending_st:play_st;
        gameover_st:n_game_st=(key_pulse==5'h10)?intro_st:gameover_st;
        ending_st:n_game_st=(key_pulse==5'h10)?intro_st:ending_st;
        default:n_game_st=intro_st;
     endcase
 end
 
 wire intro_real_on;
 wire game_over_real_on;
 wire ending_real_on;
 
 assign not_play_rst= c_game_st != play_st;
 assign intro_real_on = (c_game_st == intro_st) ? intro_on:0;
 assign game_over_real_on=(c_game_st ==  gameover_st) ? game_over_on:0;
 assign ending_real_on=(c_game_st ==  ending_st) ? ending_on:0;
 
wire [11:0] final_text_rgb = text_rgb1 | text_rgb2; // 비트별 OR 연산 
wire final_text_on = text_on1 | text_on2; // 두 신호를 OR 연산하여 통합

assign rgb = (intro_real_on)? intro_rgb :
             (game_over_real_on)?game_over_rgb:
             (ending_real_on)?ending_rgb:
             (final_text_on)? final_text_rgb :
             (maple_on)? maple_rgb :
             (monster_on)? monster_rgb :
             (skill_on)? skill_rgb:
             (monsterskill_on)? monsterskill_rgb:
             (meteor_on)? meteor_rgb:
             (background_on)? background_rgb :
             12'h000;

endmodule
