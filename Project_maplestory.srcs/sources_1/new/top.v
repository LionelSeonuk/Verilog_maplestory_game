module top(
input clk_100mhz,
input reset_poweron,
output [3:0] red,
output [3:0] green,
output [3:0] blue,
output vsync,
output hsync,
input [3:0] btn_in,
inout [7:0] key_io
); 

wire clk, rst, locked;

clk_wiz_0 clk_inst (clk, reset_poweron, locked, clk_100mhz); 
assign rst = reset_poweron | (~locked); 

wire [11:0] rgb;
wire [9:0] x, y; 
wire [4:0] key, key_pulse,key_tmp;
wire [3:0] btn,btn_pulse;
wire video_on; 
wire rst_btn;
//wire frame_tick;
assign rst_btn = btn_in[1];


keypad #(.CLK_KHZ(25175)) keypad_inst (clk, rst, key_io[7:4], key_io[3:0], key_tmp); 
debounce #(.SIZE(16), .BTN_WIDTH(5)) debounce_key (clk, rst, key_tmp, key, key_pulse); 
debounce #(.SIZE(16), .BTN_WIDTH(4)) debounce_btn (clk, rst, btn_in, btn, btn_pulse);

assign red = (video_on==1)? {{4{rgb[11:8]}}} : 0;  
assign green= (video_on==1)? {{4{rgb[7:4]}}} : 0;
assign blue = (video_on==1)? {{4{rgb[3:0]}}} : 0;

      
maplestory inst(
    .rgb        (rgb ),  // output [11:0] 
    .x          (x ),  // input  [9:0]  
    .y          (y ),  // input  [9:0]       
    .key        (key),  // input  [3:0]  
    .key_pulse  (key_pulse ),  // input  [3:0] 
    .btn        (btn),
    .btn_pulse  (btn_pulse ),  // input  [3:0] 
    .clk        (clk),  // input         
    .rst        (rst)   // input         
);              
     
     
 sync_mod sync_inst (rst, clk, x, y, video_on, vsync, hsync);              
   
endmodule