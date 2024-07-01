# Verilog Maplestory Game
&nbsp;The function of converting RGB values of images into Hex values using Python and outputting graphics using ROM files was implemented.<br>
&nbsp;In addition, various motions such as character movement, jumps, attacks, and skills were implemented through FSM (Finite State Machine)


https://github.com/LionelSeonuk/Verilog_maplestory_game/assets/167200555/f62a8b47-b18d-49e5-9dad-6a281a12e7e2

1. Press keypad[0] to start the game.
2. Use btn_in[3] (left), btn_in[4] (right), and keypad[5] (jump) to control direction.
3. Use btn_in[5] (attack)
4. The game ends when you kill boss monster.
5. If you hit monsterskill, you lose a heart.
6. If you have no heart, it’s <code>GAME OVER</code>.
7. If you kill boss monster, you reach the ```ENDING```.

# Code Explain
```verilog
wire clk, rst, locked;
```

<!--
|제작 기간|ㅁ|ㅁ|
|--|--|--|
|ㅁ|ㄴ|ㅇ|
|ㅁ|ㄴ|ㅇ|
|ㅁ|ㄴ|ㅇ|

[ㅁㄴㅇ](https://github.com/LionelSeonuk/Verilog_maplestory_game/blob/verilog/Project_maplestory.srcs/sources_1/new/top.v)
-->
