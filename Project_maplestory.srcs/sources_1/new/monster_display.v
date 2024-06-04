module monster_display(
    input clk, rst,frame_tick,
    input [9:0] xg, yg,
    output reg [11:0] rgb,
    output on, maple_hit1,
    input [9:0] maple_left, maple_top,
    output [9:0] monster_left, monster_top
);

parameter right_end = 639, bottom_end = 479;
parameter width = 102, height = 79;

//assign frame_tick = (yg==479 && xg==639)? 1 : 0;

wire [9:0] left, top;
wire [9:0] right, bottom;
assign right = left + width;
assign bottom = top + height;

assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom) && (rgb != 12'h000);

assign left = 450;
assign top = 306;



wire ground;
monster_ground monster_ground_inst(.ground(ground), .monster_x(left), .monster_y(top));

parameter monster_stand_st = 0, monster_attack_st = 1;
reg [1:0] c_monster_image_st, n_monster_image_st;

// 10초 타이머를 위한 파라미터와 레지스터
parameter COUNT = 25175000 ; 
reg [31:0] counter; // 26비트 카운터

// 타이머 카운터
always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
    end else if (counter == COUNT) begin
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end

wire tick = (counter == COUNT);

always @(posedge clk or posedge rst) begin
        if(rst) begin
            c_monster_image_st = monster_stand_st;
        end else begin
            c_monster_image_st = n_monster_image_st;
        end
    end
always @(*) begin
    n_monster_image_st = c_monster_image_st; // 기본값 할당
    if (tick) begin
        case(c_monster_image_st)
            monster_stand_st: begin
                n_monster_image_st = monster_attack_st;
            end
            monster_attack_st: begin
                n_monster_image_st = monster_stand_st;
            end
            default: begin
                n_monster_image_st = monster_stand_st;
            end
        endcase
    end
end

// RGB 출력 로직
always @(*) begin
    // 기본적으로 몬스터 이미지를 출력
    case (c_monster_image_st)
        monster_stand_st: begin
            rgb = rgb_monsterstand;
        end
        monster_attack_st: begin
            rgb = rgb_monsterattack;
        end
        default: begin
            rgb = rgb_monsterstand;
        end
    endcase
end

parameter stand_st = 0, attack_st =1;
reg [1:0] c_monster_move_st, n_monster_move_st;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        c_monster_move_st <= 0;
    end else begin 
        c_monster_move_st <= n_monster_move_st;
    end
end

reg [31:0] jump_size_index;

always @(*) begin
    case(c_monster_move_st)
        stand_st: n_monster_move_st =(frame_tick==1)? attack_st : stand_st;
        attack_st:n_monster_move_st= (frame_tick==1)? stand_st : attack_st;
        default: n_monster_move_st = stand_st;
    endcase
end


wire [11:0] rgb_monsterstand, rgb_monsterattack,rgb_monsterattack1, rgb_monsterattack2, rgb_monsterattack3, rgb_monsterskill;
monsterstand_rom monsterstand_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_monsterstand));

monsterattack21_rom monsterattack21_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_monsterattack1));
monsterattack22_rom monsterattack22_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_monsterattack2));
monsterattack23_rom monsterattack23_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_monsterattack3));



wire monsterattacking_trig;
gen_counter  #(.SIZE(12587500)) gen_clock_inst2(.clk(clk), .rst(rst), .counter_en(monsterattacking_trig)); 

reg [1:0] monsterattacking_state; // 2-bit state for monster attacking
always @(posedge clk or posedge rst) begin
    if (rst) begin 
        monsterattacking_state <= 0;
    end else if (monsterattacking_trig) begin
        monsterattacking_state <= monsterattacking_state + 1;
    end
end

assign rgb_monsterattack = (monsterattacking_state == 2'b00) ? rgb_monsterattack1 :
                            (monsterattacking_state == 2'b01) ? rgb_monsterattack2 :
                            (monsterattacking_state == 2'b10) ? rgb_monsterattack3 :
                             0;



reg c_monster_image_direction_st, n_monster_image_direction_st;
parameter monster_right_st = 0;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        c_monster_image_direction_st <= monster_right_st;
    end else begin 
        c_monster_image_direction_st <= n_monster_image_direction_st;
    end
end
   
assign monster_left = left;
assign monster_top = top;

reg [7:0] x_rom;
wire [7:0] x_rom_right;
assign x_rom_right = xg - left;

always @* begin   
    case(c_monster_image_direction_st)
        monster_right_st: x_rom = x_rom_right;
        default: x_rom = x_rom_right;
    endcase
end     
  
wire [6:0] y_rom;
assign y_rom = yg - top;

endmodule
