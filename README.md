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
wire clk, rst, locked;
```

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
