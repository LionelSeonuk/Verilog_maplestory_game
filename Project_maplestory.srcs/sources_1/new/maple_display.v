module maple_display(
    input clk, rst,
    input [9:0] xg, yg,
    input [4:0] key,
    input [1:0] btn,
    output reg [11:0] rgb,
    input frame_tick,
    output on,
    output [9:0] maple_left, maple_top,
    input [9:0] monster_left
);
    wire left_btn, right_btn;
    assign {right_btn, left_btn} = btn;
    parameter right_end = 639, bottom_end = 479;
    parameter width = 44, height = 48;

    wire [9:0] left, right;
    wire [9:0] top, bottom;
    assign right = left + width;
    assign bottom = top + height;

    assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom) && (rgb != 12'h000);

    reg [9:0] c_left, n_left, c_top, n_top;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c_left <= 100;
            c_top <= 200;
        end else begin 
            c_left <= n_left;
            c_top <= n_top;
        end
    end

    always @(*) begin
        if (frame_tick == 1 && left_btn && (left != 0)) begin
            n_left = c_left - 3;
        end else if (frame_tick == 1 && right_btn && (right <= right_end)) begin
            n_left = c_left + 3;
        end else begin
            n_left = c_left;
        end
    end

    assign left = c_left;
    assign top = c_top;

    wire ground;
    maple_ground maple_ground_inst(.ground(ground), .maple_x(left), .maple_y(top));

    parameter stand_st = 0, jump_st = 1, fall_st = 2;
    reg [1:0] c_maple_move_st, n_maple_move_st;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c_maple_move_st <= 0;
        end else begin 
            c_maple_move_st <= n_maple_move_st;
        end
    end

    reg [31:0] jump_size_index;

    always @(*) begin
        case(c_maple_move_st)
            stand_st: n_maple_move_st = !ground ? fall_st : (key == 5'h15 && frame_tick == 1) ? jump_st : stand_st;
            jump_st: n_maple_move_st = (jump_size_index == 10) ? fall_st : jump_st;
            fall_st: n_maple_move_st = (ground) ? stand_st : fall_st;
            default: n_maple_move_st = stand_st;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            jump_size_index <= 1;
        end else if (c_maple_move_st == jump_st) begin
            if (jump_size_index != 10 && frame_tick == 1) begin
                jump_size_index <= jump_size_index + 1;
            end
        end else begin
            jump_size_index <= 1;
        end
    end

    reg [31:0] jump_size;
    always @(*) begin
        case(jump_size_index)
            1: jump_size = 4;
            2: jump_size = 4;
            3: jump_size = 4;
            4: jump_size = 3;
            5: jump_size = 3;
            6: jump_size = 3;
            7: jump_size = 3;
            8: jump_size = 2;
            9: jump_size = 2;
            10: jump_size = 1;
            default: jump_size = 1;
        endcase
    end

    wire jump_rst;
    wire fall_rst;
    size_varible_gen_counter_en size_varible_gen_counter_en_inst_0(.clk(clk), .rst(rst || jump_rst), .size(jump_size * 25175), .counter_en(jump_trig_always_on));

    reg [31:0] fall_size_index;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            fall_size_index <= 10;
        end else if (c_maple_move_st == fall_st) begin
            if (fall_size_index != 1 && frame_tick == 1) begin
                fall_size_index <= fall_size_index - 1;
            end
        end else begin
            fall_size_index <= 10;
        end
    end

    reg [31:0] fall_size;

    always @(*) begin
        case(fall_size_index)
            1: fall_size = 1;
            2: fall_size = 2;
            3: fall_size = 2;
            4: fall_size = 3;
            5: fall_size = 3;
            6: fall_size = 3;
            7: fall_size = 3;
            8: fall_size = 4;
            9: fall_size = 4;
            10: fall_size = 4;
            default: fall_size = 1;
        endcase
    end

    size_varible_gen_counter_en size_varible_gen_counter_en_inst_1(.clk(clk), .rst(rst || fall_rst), .size(fall_size * 25175), .counter_en(fall_trig_always_on));

    wire jump_trig;
    wire fall_trig;

    assign jump_trig = (c_maple_move_st == jump_st) ? jump_trig_always_on : 0;
    assign fall_trig = (c_maple_move_st == fall_st) ? fall_trig_always_on : 0;
    assign jump_rst = (c_maple_move_st != jump_st);
    assign fall_rst = (c_maple_move_st != fall_st);

    always @(*) begin
        case(c_maple_move_st)
            stand_st: n_top = c_top;
            jump_st: n_top = (jump_trig) ? c_top - 1 : c_top;
            fall_st: n_top = (fall_trig) ? c_top + 1 : c_top;
            default: n_top = c_top;
        endcase
    end

    assign maple_left = left;
    assign maple_top = top;

    parameter maple_stand_st = 0, maple_walk_st = 1, maple_jump_st = 5;
    reg [2:0] c_maple_image_st, n_maple_image_st;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c_maple_image_st <= maple_stand_st;
        end else begin
            c_maple_image_st <= n_maple_image_st;
        end
    end

    always @(*) begin
        case (c_maple_image_st)
            maple_stand_st: begin
                n_maple_image_st = (c_maple_move_st == jump_st || c_maple_move_st == fall_st) ? maple_jump_st :
                                   (left_btn || right_btn) ? maple_walk_st : 
                                   maple_stand_st;
                                   
            end
            maple_walk_st: begin
                n_maple_image_st =  (c_maple_move_st == jump_st || c_maple_move_st == fall_st) ? maple_jump_st : 
                                   (!(right_btn || left_btn)) ? maple_stand_st : 
                                   maple_walk_st;
                                   
            end
            maple_jump_st: begin
                n_maple_image_st = (c_maple_move_st == stand_st) ? maple_walk_st : maple_jump_st;
            end
            default: begin
                n_maple_image_st = maple_stand_st;
            end
        endcase
    end

    wire [11:0] rgb_jump, rgb_walk, rgb_walk1, rgb_walk2, rgb_walk3, rgb_walk4, rgb_stand;

    walk1_rom walk1_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_walk1));
    walk2_rom walk2_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_walk2));
    walk3_rom walk3_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_walk3));
    walk4_rom walk4_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_walk4));

    jump_rom jump_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_jump));

    stand_rom stand_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_stand));


    always @(*) begin
        case(c_maple_image_st)
            maple_stand_st: rgb = rgb_stand;
            maple_walk_st: rgb = rgb_walk;
            maple_jump_st: rgb = rgb_jump;
            default: rgb = rgb_stand;
        endcase
    end

    wire walking_trig;
    gen_counter #(.SIZE(15105000)) gen_clock_inst0(.clk(clk), .rst(rst), .counter_en(walking_trig));

    reg [1:0] walking_state;
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
                      (walking_state == 2'b11) ? rgb_walk4 : 0;

   

    reg c_maple_image_direction_st, n_maple_image_direction_st;
    parameter maple_left_st = 0, maple_right_st = 1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c_maple_image_direction_st <= maple_left_st;
        end else begin
            c_maple_image_direction_st <= n_maple_image_direction_st;
        end
    end

    always @(*) begin
        case (c_maple_image_direction_st)
            maple_left_st: n_maple_image_direction_st = (right_btn) ? maple_right_st : maple_left_st; 
            maple_right_st: n_maple_image_direction_st = (left_btn) ? maple_left_st : maple_right_st;
            default: n_maple_image_direction_st = maple_left_st;
        endcase
    end


    reg [6:0] x_rom;
    wire [6:0] x_rom_left, x_rom_right;
    assign x_rom_left = width - (xg - left);
    assign x_rom_right = xg - left;

    always @(*) begin
        case (n_maple_image_direction_st)
            maple_left_st: x_rom = x_rom_right;
            maple_right_st: x_rom = x_rom_left;
            default: x_rom = x_rom_left;
        endcase
    end

    wire [5:0] y_rom;
    assign y_rom = yg - top;

endmodule
