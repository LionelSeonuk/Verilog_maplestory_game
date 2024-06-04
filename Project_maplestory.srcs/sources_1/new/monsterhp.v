module monsterhp(
input clk, rst,
input [9:0] xg, yg,
output wire on,
output [11:0] rgb
    );
    
    parameter WIDTH=105, HEIGHT=19;
    
    assign left=400;
    assign top=30;
    
    wire [9:0] right,left,top,bottom;
    assign right = left + WIDTH;
    assign bottom = top + HEIGHT;
    
    assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom);
    
    wire [9:0] x_rom;
    wire [8:0] y_rom;

    wire [9:0] item_x_rom;
    wire [8:0] item_y_rom;
    
    wire [9:0] mx_rom;
    wire [8:0] my_rom;
    
    assign x_rom = xg - left;
    assign y_rom = yg - top;
    
    reg [3:0] hp = 14;
    reg monster_alive =1;
    
    reg attack_signal;
    reg [1:0] monsterhp_image,n_monsterhp_image;
    reg rgb;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            hp <= 14;
            monster_alive <= 1;
            monsterhp_image <= rgb_monsterhp1;
        end else if (attack_signal && monster_alive && hp > 0) begin
            hp <= hp - 1;
            if (hp == 1) begin  // HP가 0이 되면 캐릭터 사망
                 monster_alive <= 0;
            end
        end
    end
    
    wire [11:0] rgb_monsterhp1,rgb_monsterhp2,rgb_monsterhp3,rgb_monsterhp4,rgb_monsterhp5
    ,rgb_monsterhp6,rgb_monsterhp7,rgb_monsterhp8,rgb_monsterhp9,rgb_monsterhp10
    ,rgb_monsterhp11,rgb_monsterhp12,rgb_monsterhp13,rgb_monsterhp14,rgb_item,rgb_monsterdead1,rgb_monsterdead2;
     
    monsterhp1_rom monsterhp1_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp1));
    monsterhp2_rom monsterhp2_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp2));
    monsterhp3_rom monsterhp3_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp3));
    monsterhp4_rom monsterhp4_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp4));
    monsterhp5_rom monsterhp5_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp5));
    monsterhp6_rom monsterhp6_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp6));
    monsterhp7_rom monsterhp7_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp7));
    monsterhp8_rom monsterhp8_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp8));
    monsterhp9_rom monsterhp9_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp9));
    monsterhp10_rom monsterhp10_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp10));
    monsterhp11_rom monsterhp11_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp11));
    monsterhp12_rom monsterhp12_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp12));
    monsterhp13_rom monsterhp13_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp13));
    monsterhp14_rom monsterhp14_rom_inst(.clk(clk),.x(x_rom),.y(y_rom),.color_data(rgb_monsterhp14));
    item_rom item_rom_inst(.clk(clk),.x(item_x_rom),.y(item_y_rom),.color_data(rgb_item));
    monsterdead1_rom monsterdead1_rom_inst(.clk(clk), .x(mx_rom), .y(my_rom), .color_data(rgb_monsterdead1));
    monsterdead2_rom monsterdead2_rom_inst(.clk(clk), .x(mx_rom), .y(my_rom), .color_data(rgb_monsterdead2));
   
    always @(*)begin
    case(!monster_alive)
      0: rgb=rgb_monsterdead1;
      1: rgb=rgb_monsterdead2;
      2: rgb=rgb_item;
      default: rgb = rgb_monsterdead1;
      endcase
      end

    always @(*)begin  
    case(hp)
    14: rgb = rgb_monsterhp1;
    13: rgb = rgb_monsterhp2;
    12: rgb = rgb_monsterhp3;
    11: rgb = rgb_monsterhp4;
    10: rgb = rgb_monsterhp5;
    9: rgb = rgb_monsterhp6;
    8: rgb = rgb_monsterhp7;
    7: rgb = rgb_monsterhp8;
    6: rgb = rgb_monsterhp9;
    5: rgb = rgb_monsterhp10;
    4: rgb = rgb_monsterhp11;
    3: rgb = rgb_monsterhp12;
    2: rgb = rgb_monsterhp13;
    1: rgb = rgb_monsterhp14;
    default: rgb = rgb_monsterhp1;
    endcase
    end
     
endmodule