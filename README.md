# FPGA Maplestory Game
&nbsp;The function of converting RGB values of images into Hex values using Python and outputting graphics using ROM files was implemented.<br>
&nbsp;In addition, various motions such as character movement, jumps, attacks, and skills were implemented through FSM (Finite State Machine)
<div align=center>
<img src="https://github.com/LionelSeonuk/Verilog_maplestory_game/assets/167200555/200dbc68-1b40-423a-a703-ae21f9ca8b5d" width="70%"></img>
</div>

# How to Play
1. Press keypad[0] to start the game.
2. Use btn_in[3] (left), btn_in[4] (right), and keypad[5] (jump) to control direction.
3. Use btn_in[5] (attack)
4. The game ends when you kill boss monster.
5. If you hit monsterskill, you lose a heart.
6. If you have no heart, it’s <code>GAME OVER</code>.
7. If you kill boss monster, you reach the ```ENDING```.
8. 
# Video
https://github.com/LionelSeonuk/Verilog_maplestory_game/assets/167200555/f62a8b47-b18d-49e5-9dad-6a281a12e7e2

# Code Explain
```verilog
always @(*) begin
if (frame_tick==1 && left_btn && (left != 0)) begin
n_left = c_left - 3;
end else if (frame_tick==1 && right_btn &&(right <= right_end)) begin
n_left = c_left + 3;
end else begin
n_left = c_left;
end
end
```
Implement movement motion
<br>
```verilog
always @(posedge clk or posedge rst) begin
if(rst) begin
jump_size_index <= 1;
end else if(c_maple_move_st == jump_st) begin
if(jump_size_index != 8 && frame_tick==1 ) begin
jump_size_index <= jump_size_index + 1;
end
end else begin
jump_size_index <= 1;
end
end
```
Jump size index update
<br>
```verilog
reg [31:0] jump_size;
always @(*) begin
case(jump_size_index)
1 : jump_size = 1 ;
2 : jump_size = 1 ;
3 : jump_size = 1 ;
4 : jump_size = 1 ;
...
default: jump_size = 1;
endcase
end
```
Determining Jump Size
<br>
```verilog
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
```
Implementing an Attack
<br>
```verilog
always @(*) begin
case(maple_life_st)
LIFE_4_ST: n_maple_life_st = (hit1||hit2) ? LIFE_3_ST : LIFE_4_ST;...

always @(*) begin
case(maple_life_st)
LIFE_4_ST: begin 
life_on1_0 <=1; life_on2_0 <=1; life_on3_0 <=1; life_on4_0 <=1;
end...
```
Realizing your physical strength
<br>
```verilog
assign life_x_l = 100; 
assign life_y_t = 10; 

assign life_on1 = (y>=life_y_t && y<life_y_t+16 && x>=life_x_l && x<life_x_l+16*1 && life_on1_0)? 1 : 0; ...

always @(*) begin
if (x>=life_x_l+16*0 && x<life_x_l+16*1) begin bit_addr_l = (x-life_x_l-16*0)>>1; char_addr_l = 7'b0000011; end ...

```
Implementing an Hp
<br>
```verilog
always @(posedge clk or posedge rst) begin
if (rst) stable_d <= 1'b0;
else stable_d <= monster_hit_0;
end

assign monster_hit = monster_hit_0 & (~stable_d);

assign monster_hit_0 = (skill_x_rom <= monster_left) ? 1 : 0;

```
Implementing an hit
<br>
```verilog
reg [1:0] walking_state; // 2-bit state for walking
always @(posedge clk or posedge rst) begin
    if (rst) begin 
        walking_state <= 0;
    end else if ((walking_trig && left_btn) || (walking_trig && right_btn)) begin
        walking_state <= walking_state + 1;
    end
end
assign rgb_walk = (walking_state == 2'b00) ? rgb_walk1 :
                   (walking_state == 2'b01) ? rgb_walk2 :
                   (walking_state == 2'b10) ? rgb_walk3 :
                   (walking_state == 2'b11) ? rgb_walk4 :
                   0;
```
Implementing walk
<!--<img src="https://github.com/LionelSeonuk/Verilog_maplestory_game/assets/167200555/b15893a2-4a7d-4501-ab80-2f5483482bbe" width="50%"></img>-->

<!--
![687474703a2f2f6366696c65362e75662e746973746f72792e636f6d2f696d6167652f32343236453634363534334339423435333243374230](https://github.com/LionelSeonuk/Verilog_maplestory_game/assets/167200555/b15893a2-4a7d-4501-ab80-2f5483482bbe)-->
<!--
![ezgif-7-8e01bfd68d](https://github.com/LionelSeonuk/Verilog_maplestory_game/assets/167200555/200dbc68-1b40-423a-a703-ae21f9ca8b5d)-->

<!--
|제작 기간|ㅁ|ㅁ|
|--|--|--|
|ㅁ|ㄴ|ㅇ|
|ㅁ|ㄴ|ㅇ|
|ㅁ|ㄴ|ㅇ|

[ㅁㄴㅇ](https://github.com/LionelSeonuk/Verilog_maplestory_game/blob/verilog/Project_maplestory.srcs/sources_1/new/top.v)
-->
