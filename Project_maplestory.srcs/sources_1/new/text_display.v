module text_display(
        output [11:0] rgb         ,
        output        on          ,
        output [11:0] m_rgb         ,
        output        m_on          ,
        output        game_over   ,
        output        ending      ,
        input         clk         ,
        input         rst         ,
        input  [9:0]  x           ,
        input  [9:0]  y           ,
        input         c_game_st     ,
        input         maple_hit1,maple_hit2   ,
        input         monster_hit
);

/*---------------------------------------------------------*/
// hit
/*---------------------------------------------------------*/

reg life_on1_0, life_on2_0, life_on3_0,life_on4_0;
reg mlife_on1_0, mlife_on2_0, mlife_on3_0,mlife_on4_0,mlife_on5_0,mlife_on6_0,mlife_on7_0,mlife_on8_0;
reg [2:0] maple_life_st, n_maple_life_st;
parameter  LIFE_4_ST = 0,LIFE_3_ST = 1, LIFE_2_ST = 2, LIFE_1_ST =3,  DEAD_ST = 4;
parameter PLAY_ST = 1;
parameter  MLIFE_8_ST = 0, MLIFE_7_ST = 1,MLIFE_6_ST = 2,MLIFE_5_ST = 3,MLIFE_4_ST = 4,MLIFE_3_ST = 5,MLIFE_2_ST = 6,MLIFE_1_ST = 7,MDEAD_ST=8;

assign hit1 = maple_hit1;
assign hit2 = maple_hit2;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        maple_life_st <= LIFE_4_ST;
        monster_life_st <= MLIFE_8_ST;
    end else begin
        maple_life_st <= n_maple_life_st;
        monster_life_st <= n_monster_life_st;
    end
end

always @(*) begin
    case(maple_life_st)
        LIFE_4_ST: n_maple_life_st = (hit1||hit2) ? LIFE_3_ST : LIFE_4_ST;
        LIFE_3_ST: n_maple_life_st = (hit1||hit2) ? LIFE_2_ST : LIFE_3_ST;
        LIFE_2_ST: n_maple_life_st = (hit1||hit2) ? LIFE_1_ST : LIFE_2_ST;
        LIFE_1_ST: n_maple_life_st = (hit1||hit2) ? DEAD_ST : LIFE_1_ST;
        DEAD_ST: n_maple_life_st = (c_game_st == PLAY_ST) ? LIFE_4_ST : DEAD_ST;
        default: n_maple_life_st =  LIFE_4_ST;
    endcase
end

always @(*) begin
    case(maple_life_st)
        LIFE_4_ST: begin  
            life_on1_0 <=1; life_on2_0 <=1; life_on3_0 <=1; life_on4_0 <=1;
        end
        LIFE_3_ST: begin  
            life_on1_0 <=1; life_on2_0 <=1; life_on3_0 <=1; life_on4_0 <=0;
        end

        LIFE_2_ST: begin  
            life_on1_0 <=1; life_on2_0 <=1; life_on3_0 <=0; life_on4_0 <=0;
        end

        LIFE_1_ST: begin  
            life_on1_0 <=1; life_on2_0 <=0; life_on3_0 <=0; life_on4_0 <=0;
        end   
            
        DEAD_ST: begin
            life_on1_0 <=0; life_on2_0 <=0; life_on3_0 <=0; life_on4_0 <=0;
        end

        default: begin  
            life_on1_0 <=1; life_on2_0 <=1; life_on3_0 <=1; life_on4_0 <=1;
        end
    endcase
end

wire game_over_0;
assign game_over_0 = (maple_life_st == DEAD_ST);

reg game_over_stable_d;

always @(posedge clk or posedge rst)begin
    if (rst) game_over_stable_d <= 1'b0;
    else game_over_stable_d <= game_over_0; 
end 

assign game_over = game_over_0 & (~game_over_stable_d); 

reg [3:0] monster_life_st, n_monster_life_st;
assign mhit = monster_hit;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        monster_life_st <= MLIFE_8_ST;
    end else begin
        monster_life_st <= n_monster_life_st;
    end
end

always @(*) begin
    case(monster_life_st)
        MLIFE_8_ST: n_monster_life_st = (mhit) ? MLIFE_7_ST : MLIFE_8_ST;
        MLIFE_7_ST: n_monster_life_st = (mhit) ? MLIFE_6_ST : MLIFE_7_ST;
        MLIFE_6_ST: n_monster_life_st = (mhit) ? MLIFE_5_ST : MLIFE_6_ST;
        MLIFE_5_ST: n_monster_life_st = (mhit) ? MLIFE_4_ST : MLIFE_5_ST;
        MLIFE_4_ST: n_monster_life_st = (mhit) ? MLIFE_3_ST : MLIFE_4_ST;
        MLIFE_3_ST: n_monster_life_st = (mhit) ? MLIFE_2_ST : MLIFE_3_ST;
        MLIFE_2_ST: n_monster_life_st = (mhit) ? MLIFE_1_ST : MLIFE_2_ST;
        MLIFE_1_ST:n_monster_life_st = (mhit) ? MDEAD_ST : MLIFE_1_ST;
        MDEAD_ST: n_monster_life_st = (c_game_st == PLAY_ST) ? MLIFE_8_ST : MDEAD_ST;
        default: n_monster_life_st = MLIFE_8_ST;
    endcase
end

always @(*) begin
    case(monster_life_st)
  
    MLIFE_8_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 1; mlife_on5_0 <= 1; mlife_on6_0 <= 1; mlife_on7_0 <= 1; mlife_on8_0 <= 1;
    end
    MLIFE_7_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 1; mlife_on5_0 <= 1; mlife_on6_0 <= 1; mlife_on7_0 <= 1; mlife_on8_0 <= 0; 
    end
    MLIFE_6_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 1; mlife_on5_0 <= 1; mlife_on6_0 <= 1; mlife_on7_0 <= 0; mlife_on8_0 <= 0; 
    end
    MLIFE_5_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 1; mlife_on5_0 <= 1; mlife_on6_0 <= 0; mlife_on7_0 <= 0; mlife_on8_0 <= 0;
    end
    MLIFE_4_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 1; mlife_on5_0 <= 0; mlife_on6_0 <= 0; mlife_on7_0 <= 0; mlife_on8_0 <= 0;
    end
    MLIFE_3_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 0; mlife_on5_0 <= 0; mlife_on6_0 <= 0; mlife_on7_0 <= 0; mlife_on8_0 <= 0;
    end
    MLIFE_2_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 0; mlife_on4_0 <= 0; mlife_on5_0 <= 0; mlife_on6_0 <= 0; mlife_on7_0 <= 0; mlife_on8_0 <= 0; 
    end
    MLIFE_1_ST: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 0; mlife_on3_0 <= 0; mlife_on4_0 <= 0; mlife_on5_0 <= 0; mlife_on6_0 <= 0; mlife_on7_0 <= 0; mlife_on8_0 <= 0;
    end
    MDEAD_ST: begin
    mlife_on1_0 <= 0; mlife_on2_0 <= 0; mlife_on3_0 <= 0; mlife_on4_0 <= 0; mlife_on5_0 <= 0; mlife_on6_0 <= 0; mlife_on7_0 <= 0; mlife_on8_0 <= 0; 
    end
    default: begin  
    mlife_on1_0 <= 1; mlife_on2_0 <= 1; mlife_on3_0 <= 1; mlife_on4_0 <= 1; mlife_on5_0 <= 1; mlife_on6_0 <= 1; mlife_on7_0 <= 1; mlife_on8_0 <= 1;
end
  
    endcase
end

wire ending_0;
assign ending_0 = (monster_life_st == DEAD_ST);

reg ending_stable_d;

always @(posedge clk or posedge rst)begin
    if (rst) ending_stable_d<= 1'b0;
    else ending_stable_d <= ending_0; 
end 

assign ending = ending_0 & (~ending_stable_d); 


/*---------------------------------------------------------*/
// text on screen 
/*---------------------------------------------------------*/

wire [6:0] char_addr;
reg [6:0] char_addr_s, char_addr_l;
wire [2:0] bit_addr;
reg [2:0] bit_addr_s, bit_addr_l;
wire [3:0] row_addr, row_addr_s, row_addr_l; 

wire  life_on1, life_on2, life_on3, life_on4;

wire font_bit;
wire [7:0] font_word;
wire [10:0] rom_addr;

font_rom_vhd font_rom_inst0 (clk, rom_addr, font_word);

assign rom_addr = {char_addr, row_addr};
assign font_bit = font_word[~bit_addr]; 

assign char_addr = (life_on1)? char_addr_l :(life_on2)? char_addr_l:(life_on3) ?char_addr_l:(life_on4)? char_addr_l:0;
assign row_addr = (life_on1)? row_addr_l :  (life_on2)? row_addr_l: (life_on3)? row_addr_l:(life_on4)? row_addr_l: 0; 
assign bit_addr =  (life_on1)? bit_addr_l : (life_on2)? bit_addr_l:(life_on3)?bit_addr_l:(life_on4)? bit_addr_l :0; 

///////////////////////////////////////////////////////////////////////////
wire [6:0] m_char_addr;
reg [6:0] m_char_addr_s, m_char_addr_l;
wire [2:0] m_bit_addr;
reg [2:0] m_bit_addr_s, m_bit_addr_l;
wire [3:0] m_row_addr, m_row_addr_s, m_row_addr_l;

wire  mlife_on1, mlife_on2, mlife_on3,mlife_on4,mlife_on5,mlife_on6,mlife_on7,mlife_on8;

wire m_font_bit;
wire [7:0] m_font_word;
wire [10:0] m_rom_addr;

font_rom_vhd font_rom_inst1 (clk, m_rom_addr, m_font_word);

assign m_rom_addr = {m_char_addr, m_row_addr};
assign m_font_bit = m_font_word[~m_bit_addr]; 

assign m_char_addr = (mlife_on1)? m_char_addr_l :(mlife_on2)? m_char_addr_l:(mlife_on3) ?m_char_addr_l:(mlife_on4) ?m_char_addr_l:(mlife_on5) ?m_char_addr_l :
(mlife_on6) ?m_char_addr_l :(mlife_on7) ?m_char_addr_l :(mlife_on8) ?m_char_addr_l:0;
assign m_row_addr = (mlife_on1)? m_row_addr_l :  (mlife_on2)? m_row_addr_l: (mlife_on3)? m_row_addr_l :(mlife_on4)? m_row_addr_l :(mlife_on5)? m_row_addr_l :
(mlife_on6)? m_row_addr_l :(mlife_on7)? m_row_addr_l :(mlife_on8)? m_row_addr_l: 0; 
assign m_bit_addr =  (mlife_on1)? m_bit_addr_l : (mlife_on2)? m_bit_addr_l:(mlife_on3)?m_bit_addr_l : (mlife_on4)?m_bit_addr_l :(mlife_on5)?m_bit_addr_l :
(mlife_on6)?m_bit_addr_l :(mlife_on7)?m_bit_addr_l :(mlife_on8)?m_bit_addr_l:0; 


/*---------------------------------------------------------*/


wire [9:0] life_x_l, life_y_t; 
assign life_x_l = 100; 
assign life_y_t = 10; 
assign life_on1 = (y>=life_y_t && y<life_y_t+16 && x>=life_x_l && x<life_x_l+16*1 && life_on1_0)? 1 : 0;
assign life_on2 = (y>=life_y_t && y<life_y_t+16 && x>=life_x_l && x<life_x_l+16*2 && life_on2_0)? 1 : 0;
assign life_on3 = (y>=life_y_t && y<life_y_t+16 && x>=life_x_l && x<life_x_l+16*3 && life_on3_0)? 1 : 0;
assign life_on4 = (y>=life_y_t && y<life_y_t+16 && x>=life_x_l && x<life_x_l+16*4 && life_on4_0)? 1 : 0;
assign row_addr_l = (y-life_y_t);

always @(*) begin
    if (x>=life_x_l+16*0 && x<life_x_l+16*1) begin bit_addr_l = (x-life_x_l-16*0)>>1; char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=life_x_l+16*1 && x<life_x_l+16*2) begin bit_addr_l = (x-life_x_l-16*1)>>1; char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=life_x_l+16*2 && x<life_x_l+16*3) begin bit_addr_l = (x-life_x_l-16*2)>>1; char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=life_x_l+16*3 && x<life_x_l+16*4) begin bit_addr_l = (x-life_x_l-16*3)>>1; char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else begin bit_addr_l = 0; char_addr_l = 0; end   
end 

assign on =  (font_bit && life_on1) || (font_bit && life_on2) || (font_bit && life_on3);
assign rgb = 12'hf00;

wire [9:0] mlife_x_l, mlife_y_t; 
assign mlife_x_l = 350; 
assign mlife_y_t = 10; 
assign mlife_on1 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*1 && mlife_on1_0)? 1 : 0;
assign mlife_on2 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*2 && mlife_on2_0)? 1 : 0;
assign mlife_on3 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*3 && mlife_on3_0)? 1 : 0;
assign mlife_on4 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*4 && mlife_on4_0)? 1 : 0;
assign mlife_on5 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*4 && mlife_on5_0)? 1 : 0;
assign mlife_on6 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*5 && mlife_on6_0)? 1 : 0;
assign mlife_on7 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*6 && mlife_on7_0)? 1 : 0;
assign mlife_on8 = (y>=mlife_y_t && y<mlife_y_t+16 && x>=mlife_x_l && x<mlife_x_l+16*7 && mlife_on8_0)? 1 : 0;
assign m_row_addr_l = (y-mlife_y_t);

always @(*) begin
    if (x>=mlife_x_l+16*0 && x<mlife_x_l+16*1) begin m_bit_addr_l = (x-mlife_x_l-16*0)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*1 && x<mlife_x_l+16*2) begin m_bit_addr_l = (x-mlife_x_l-16*1)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*2 && x<mlife_x_l+16*3) begin m_bit_addr_l = (x-mlife_x_l-16*2)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*3 && x<mlife_x_l+16*4) begin m_bit_addr_l = (x-mlife_x_l-16*3)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*4 && x<mlife_x_l+16*5) begin m_bit_addr_l = (x-mlife_x_l-16*4)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*5 && x<mlife_x_l+16*6) begin m_bit_addr_l = (x-mlife_x_l-16*5)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*6 && x<mlife_x_l+16*7) begin m_bit_addr_l = (x-mlife_x_l-16*6)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else if (x>=mlife_x_l+16*7 && x<mlife_x_l+16*8) begin m_bit_addr_l = (x-mlife_x_l-16*7)>>1; m_char_addr_l = 7'b0000011; end // ?????¢¬  x03 
    else begin m_bit_addr_l = 0; m_char_addr_l = 0; end   
end 

assign m_on =  (m_font_bit && mlife_on1) || (m_font_bit && mlife_on2) || (m_font_bit && mlife_on3) || (m_font_bit && mlife_on4) || (m_font_bit && mlife_on5)
	         || (m_font_bit && mlife_on6)|| (m_font_bit && mlife_on7)|| (m_font_bit && mlife_on8);
assign m_rgb = 12'hf00;

endmodule