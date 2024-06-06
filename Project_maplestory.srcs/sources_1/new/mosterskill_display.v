module monsterskill_display(
input clk,rst,
input [9:0] xg,yg,
output [11:0] rgb,
output on,
output [9:0] monsterskill_top,monsterskill_left
);

parameter right_end=639, bottom_end = 479;
parameter width = 33, height=19;

wire [9:0] left, right;
wire [9:0] top, bottom;
assign right = left + width;
assign bottom = top + height;

assign on = (left <= xg && xg <= right) && (top <= yg && yg <= bottom)&& (rgb != 12'h000);
wire [5:0] x_rom;
wire [4:0] y_rom;
assign x_rom = xg - left;
assign y_rom = yg - top;

monsterskil12_rom monsterskil12_rom_inst(.clk(clk), .x(x_rom), .y(y_rom), .color_data(rgb_monsterskill));

reg [9:0] c_left, n_left, c_top, n_top;
reg [31:0] death_timer;  // 타이머 변수
reg [1:0] death_state;   // 상태 변수

reg [3:0] skill_count;  // Counter for the number of skills fired
reg [31:0] skill_timer; // Timer for skill firing
reg skill_firing;       // Flag indicating if skills are being fired

always @(posedge clk or posedge rst) begin
    if (rst) begin
        c_left <= 400;
        c_top <= 100;
        death_timer <= 0;
        death_state <= 0;
        skill_count <= 0;
        skill_timer <= 0;
        skill_firing <= 0;
    end else begin 
        c_left <= n_left;
        c_top <= n_top;

        // 타이머 증가 및 상태 전환 로직
        if (!monster_hp_on && !on) begin
            death_timer <= death_timer + 1;
            if (death_timer == 25_175_000) begin  // 1초 간격으로 상태 전환 
                death_timer <= 0;
                if (death_state < 2)
                    death_state <= death_state + 1;
            end
        end else begin
            death_timer <= 0;
            death_state <= 0;
        end
                if (skill_firing) begin
            skill_timer <= skill_timer + 1;
            if (skill_timer == 5_035_000) begin  // 0.2초 간격으로 스킬 발사
                skill_timer <= 0;
                skill_count <= skill_count + 1;
                if (skill_count == 5) begin
                    skill_firing <= 0;
                    skill_count <= 0;
                end
            end
        end else begin
            skill_timer <= skill_timer + 1;
            if (skill_timer == 251_750_000) begin  // 10초 간격으로 스킬 발사 주기 시작 (클럭이 50MHz일 경우)
                skill_timer <= 0;
                skill_firing <= 1;
            end
        end
    end
end

endmodule