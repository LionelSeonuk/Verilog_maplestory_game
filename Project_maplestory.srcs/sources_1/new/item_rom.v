module item_rom(
        input wire clk,
        input wire [3:0] x,
        input wire [4:0] y,
        output reg [11:0] color_data
);

    (* rom_style = "block" *)

    //signal declaration
    reg [3:0] x_reg;
    reg [4:0] y_reg;

    always @(posedge clk) begin
        x_reg <= x;
        y_reg <= y;
    end

    always @*
        case ({x_reg, y_reg})
			// right: 4'd15, bottom: 5'd19
			{4'd0, 5'd0}: color_data = 12'h000;
			{4'd0, 5'd1}: color_data = 12'h000;
			{4'd0, 5'd2}: color_data = 12'h000;
			{4'd0, 5'd3}: color_data = 12'h000;
			{4'd0, 5'd4}: color_data = 12'h000;
			{4'd0, 5'd5}: color_data = 12'h000;
			{4'd0, 5'd6}: color_data = 12'h000;
			{4'd0, 5'd7}: color_data = 12'h000;
			{4'd0, 5'd8}: color_data = 12'h000;
			{4'd0, 5'd9}: color_data = 12'h000;
			{4'd0, 5'd10}: color_data = 12'h000;
			{4'd0, 5'd11}: color_data = 12'h000;
			{4'd0, 5'd12}: color_data = 12'h000;
			{4'd0, 5'd13}: color_data = 12'h000;
			{4'd0, 5'd14}: color_data = 12'h000;
			{4'd0, 5'd15}: color_data = 12'h000;
			{4'd0, 5'd16}: color_data = 12'h000;
			{4'd0, 5'd17}: color_data = 12'h000;
			{4'd0, 5'd18}: color_data = 12'h493;
			{4'd0, 5'd19}: color_data = 12'h383;
			{4'd1, 5'd0}: color_data = 12'h000;
			{4'd1, 5'd1}: color_data = 12'h000;
			{4'd1, 5'd2}: color_data = 12'h000;
			{4'd1, 5'd3}: color_data = 12'h000;
			{4'd1, 5'd4}: color_data = 12'h000;
			{4'd1, 5'd5}: color_data = 12'h000;
			{4'd1, 5'd6}: color_data = 12'h000;
			{4'd1, 5'd7}: color_data = 12'h000;
			{4'd1, 5'd8}: color_data = 12'h000;
			{4'd1, 5'd9}: color_data = 12'h000;
			{4'd1, 5'd10}: color_data = 12'h000;
			{4'd1, 5'd11}: color_data = 12'h000;
			{4'd1, 5'd12}: color_data = 12'h000;
			{4'd1, 5'd13}: color_data = 12'h000;
			{4'd1, 5'd14}: color_data = 12'h000;
			{4'd1, 5'd15}: color_data = 12'h000;
			{4'd1, 5'd16}: color_data = 12'h000;
			{4'd1, 5'd17}: color_data = 12'h382;
			{4'd1, 5'd18}: color_data = 12'h4b2;
			{4'd1, 5'd19}: color_data = 12'h161;
			{4'd2, 5'd0}: color_data = 12'h000;
			{4'd2, 5'd1}: color_data = 12'h000;
			{4'd2, 5'd2}: color_data = 12'h000;
			{4'd2, 5'd3}: color_data = 12'h000;
			{4'd2, 5'd4}: color_data = 12'h000;
			{4'd2, 5'd5}: color_data = 12'h000;
			{4'd2, 5'd6}: color_data = 12'h000;
			{4'd2, 5'd7}: color_data = 12'h000;
			{4'd2, 5'd8}: color_data = 12'h000;
			{4'd2, 5'd9}: color_data = 12'h000;
			{4'd2, 5'd10}: color_data = 12'h000;
			{4'd2, 5'd11}: color_data = 12'h000;
			{4'd2, 5'd12}: color_data = 12'h000;
			{4'd2, 5'd13}: color_data = 12'h000;
			{4'd2, 5'd14}: color_data = 12'h000;
			{4'd2, 5'd15}: color_data = 12'h150;
			{4'd2, 5'd16}: color_data = 12'h262;
			{4'd2, 5'd17}: color_data = 12'h281;
			{4'd2, 5'd18}: color_data = 12'h170;
			{4'd2, 5'd19}: color_data = 12'h040;
			{4'd3, 5'd0}: color_data = 12'h000;
			{4'd3, 5'd1}: color_data = 12'h000;
			{4'd3, 5'd2}: color_data = 12'h000;
			{4'd3, 5'd3}: color_data = 12'h501;
			{4'd3, 5'd4}: color_data = 12'h700;
			{4'd3, 5'd5}: color_data = 12'h400;
			{4'd3, 5'd6}: color_data = 12'h000;
			{4'd3, 5'd7}: color_data = 12'h000;
			{4'd3, 5'd8}: color_data = 12'h000;
			{4'd3, 5'd9}: color_data = 12'h000;
			{4'd3, 5'd10}: color_data = 12'h000;
			{4'd3, 5'd11}: color_data = 12'h000;
			{4'd3, 5'd12}: color_data = 12'h000;
			{4'd3, 5'd13}: color_data = 12'h000;
			{4'd3, 5'd14}: color_data = 12'h140;
			{4'd3, 5'd15}: color_data = 12'h251;
			{4'd3, 5'd16}: color_data = 12'h272;
			{4'd3, 5'd17}: color_data = 12'h141;
			{4'd3, 5'd18}: color_data = 12'h000;
			{4'd3, 5'd19}: color_data = 12'h000;
			{4'd4, 5'd0}: color_data = 12'h000;
			{4'd4, 5'd1}: color_data = 12'h000;
			{4'd4, 5'd2}: color_data = 12'h000;
			{4'd4, 5'd3}: color_data = 12'hc03;
			{4'd4, 5'd4}: color_data = 12'he04;
			{4'd4, 5'd5}: color_data = 12'hc24;
			{4'd4, 5'd6}: color_data = 12'h05a;
			{4'd4, 5'd7}: color_data = 12'h000;
			{4'd4, 5'd8}: color_data = 12'h000;
			{4'd4, 5'd9}: color_data = 12'h000;
			{4'd4, 5'd10}: color_data = 12'h000;
			{4'd4, 5'd11}: color_data = 12'h000;
			{4'd4, 5'd12}: color_data = 12'h000;
			{4'd4, 5'd13}: color_data = 12'h794;
			{4'd4, 5'd14}: color_data = 12'h472;
			{4'd4, 5'd15}: color_data = 12'h141;
			{4'd4, 5'd16}: color_data = 12'h000;
			{4'd4, 5'd17}: color_data = 12'h000;
			{4'd4, 5'd18}: color_data = 12'h000;
			{4'd4, 5'd19}: color_data = 12'h000;
			{4'd5, 5'd0}: color_data = 12'h000;
			{4'd5, 5'd1}: color_data = 12'h000;
			{4'd5, 5'd2}: color_data = 12'h700;
			{4'd5, 5'd3}: color_data = 12'he02;
			{4'd5, 5'd4}: color_data = 12'hf02;
			{4'd5, 5'd5}: color_data = 12'hc12;
			{4'd5, 5'd6}: color_data = 12'ha13;
			{4'd5, 5'd7}: color_data = 12'h701;
			{4'd5, 5'd8}: color_data = 12'h100;
			{4'd5, 5'd9}: color_data = 12'h8b4;
			{4'd5, 5'd10}: color_data = 12'h7a3;
			{4'd5, 5'd11}: color_data = 12'h262;
			{4'd5, 5'd12}: color_data = 12'h493;
			{4'd5, 5'd13}: color_data = 12'h583;
			{4'd5, 5'd14}: color_data = 12'h793;
			{4'd5, 5'd15}: color_data = 12'h000;
			{4'd5, 5'd16}: color_data = 12'h000;
			{4'd5, 5'd17}: color_data = 12'h000;
			{4'd5, 5'd18}: color_data = 12'h000;
			{4'd5, 5'd19}: color_data = 12'h000;
			{4'd6, 5'd0}: color_data = 12'h000;
			{4'd6, 5'd1}: color_data = 12'h701;
			{4'd6, 5'd2}: color_data = 12'ha02;
			{4'd6, 5'd3}: color_data = 12'ha00;
			{4'd6, 5'd4}: color_data = 12'ha00;
			{4'd6, 5'd5}: color_data = 12'ha00;
			{4'd6, 5'd6}: color_data = 12'ha01;
			{4'd6, 5'd7}: color_data = 12'hb01;
			{4'd6, 5'd8}: color_data = 12'hb01;
			{4'd6, 5'd9}: color_data = 12'h741;
			{4'd6, 5'd10}: color_data = 12'h583;
			{4'd6, 5'd11}: color_data = 12'h261;
			{4'd6, 5'd12}: color_data = 12'h483;
			{4'd6, 5'd13}: color_data = 12'h151;
			{4'd6, 5'd14}: color_data = 12'h050;
			{4'd6, 5'd15}: color_data = 12'h000;
			{4'd6, 5'd16}: color_data = 12'h000;
			{4'd6, 5'd17}: color_data = 12'h000;
			{4'd6, 5'd18}: color_data = 12'h000;
			{4'd6, 5'd19}: color_data = 12'h000;
			{4'd7, 5'd0}: color_data = 12'h000;
			{4'd7, 5'd1}: color_data = 12'hc14;
			{4'd7, 5'd2}: color_data = 12'he24;
			{4'd7, 5'd3}: color_data = 12'hb12;
			{4'd7, 5'd4}: color_data = 12'hc00;
			{4'd7, 5'd5}: color_data = 12'hf01;
			{4'd7, 5'd6}: color_data = 12'hc01;
			{4'd7, 5'd7}: color_data = 12'hb00;
			{4'd7, 5'd8}: color_data = 12'hd00;
			{4'd7, 5'd9}: color_data = 12'h900;
			{4'd7, 5'd10}: color_data = 12'h451;
			{4'd7, 5'd11}: color_data = 12'h382;
			{4'd7, 5'd12}: color_data = 12'h000;
			{4'd7, 5'd13}: color_data = 12'h3a2;
			{4'd7, 5'd14}: color_data = 12'h5c2;
			{4'd7, 5'd15}: color_data = 12'h141;
			{4'd7, 5'd16}: color_data = 12'h000;
			{4'd7, 5'd17}: color_data = 12'h000;
			{4'd7, 5'd18}: color_data = 12'h000;
			{4'd7, 5'd19}: color_data = 12'h000;
			{4'd8, 5'd0}: color_data = 12'h000;
			{4'd8, 5'd1}: color_data = 12'hd36;
			{4'd8, 5'd2}: color_data = 12'hb01;
			{4'd8, 5'd3}: color_data = 12'hb12;
			{4'd8, 5'd4}: color_data = 12'hc12;
			{4'd8, 5'd5}: color_data = 12'hd00;
			{4'd8, 5'd6}: color_data = 12'hb00;
			{4'd8, 5'd7}: color_data = 12'hd01;
			{4'd8, 5'd8}: color_data = 12'hd00;
			{4'd8, 5'd9}: color_data = 12'ha00;
			{4'd8, 5'd10}: color_data = 12'h430;
			{4'd8, 5'd11}: color_data = 12'h393;
			{4'd8, 5'd12}: color_data = 12'h7a3;
			{4'd8, 5'd13}: color_data = 12'h6c2;
			{4'd8, 5'd14}: color_data = 12'h6e3;
			{4'd8, 5'd15}: color_data = 12'h3a2;
			{4'd8, 5'd16}: color_data = 12'h000;
			{4'd8, 5'd17}: color_data = 12'h000;
			{4'd8, 5'd18}: color_data = 12'h000;
			{4'd8, 5'd19}: color_data = 12'h000;
			{4'd9, 5'd0}: color_data = 12'h000;
			{4'd9, 5'd1}: color_data = 12'hc24;
			{4'd9, 5'd2}: color_data = 12'hb00;
			{4'd9, 5'd3}: color_data = 12'hb00;
			{4'd9, 5'd4}: color_data = 12'hc02;
			{4'd9, 5'd5}: color_data = 12'hc02;
			{4'd9, 5'd6}: color_data = 12'h900;
			{4'd9, 5'd7}: color_data = 12'hc13;
			{4'd9, 5'd8}: color_data = 12'hb00;
			{4'd9, 5'd9}: color_data = 12'ha00;
			{4'd9, 5'd10}: color_data = 12'h300;
			{4'd9, 5'd11}: color_data = 12'h000;
			{4'd9, 5'd12}: color_data = 12'h492;
			{4'd9, 5'd13}: color_data = 12'h4c2;
			{4'd9, 5'd14}: color_data = 12'h7f3;
			{4'd9, 5'd15}: color_data = 12'h4b2;
			{4'd9, 5'd16}: color_data = 12'h000;
			{4'd9, 5'd17}: color_data = 12'h000;
			{4'd9, 5'd18}: color_data = 12'h000;
			{4'd9, 5'd19}: color_data = 12'h000;
			{4'd10, 5'd0}: color_data = 12'h000;
			{4'd10, 5'd1}: color_data = 12'hb01;
			{4'd10, 5'd2}: color_data = 12'hc01;
			{4'd10, 5'd3}: color_data = 12'ha00;
			{4'd10, 5'd4}: color_data = 12'ha01;
			{4'd10, 5'd5}: color_data = 12'hb00;
			{4'd10, 5'd6}: color_data = 12'h900;
			{4'd10, 5'd7}: color_data = 12'he14;
			{4'd10, 5'd8}: color_data = 12'hb01;
			{4'd10, 5'd9}: color_data = 12'h800;
			{4'd10, 5'd10}: color_data = 12'h000;
			{4'd10, 5'd11}: color_data = 12'h000;
			{4'd10, 5'd12}: color_data = 12'h492;
			{4'd10, 5'd13}: color_data = 12'h6d2;
			{4'd10, 5'd14}: color_data = 12'haf3;
			{4'd10, 5'd15}: color_data = 12'h4a2;
			{4'd10, 5'd16}: color_data = 12'h000;
			{4'd10, 5'd17}: color_data = 12'h000;
			{4'd10, 5'd18}: color_data = 12'h000;
			{4'd10, 5'd19}: color_data = 12'h000;
			{4'd11, 5'd0}: color_data = 12'h000;
			{4'd11, 5'd1}: color_data = 12'h801;
			{4'd11, 5'd2}: color_data = 12'hd01;
			{4'd11, 5'd3}: color_data = 12'hb01;
			{4'd11, 5'd4}: color_data = 12'hb01;
			{4'd11, 5'd5}: color_data = 12'hd01;
			{4'd11, 5'd6}: color_data = 12'hb00;
			{4'd11, 5'd7}: color_data = 12'he03;
			{4'd11, 5'd8}: color_data = 12'hb02;
			{4'd11, 5'd9}: color_data = 12'h400;
			{4'd11, 5'd10}: color_data = 12'h000;
			{4'd11, 5'd11}: color_data = 12'h000;
			{4'd11, 5'd12}: color_data = 12'h582;
			{4'd11, 5'd13}: color_data = 12'h6c3;
			{4'd11, 5'd14}: color_data = 12'h7c3;
			{4'd11, 5'd15}: color_data = 12'h462;
			{4'd11, 5'd16}: color_data = 12'h000;
			{4'd11, 5'd17}: color_data = 12'h000;
			{4'd11, 5'd18}: color_data = 12'h000;
			{4'd11, 5'd19}: color_data = 12'h000;
			{4'd12, 5'd0}: color_data = 12'h000;
			{4'd12, 5'd1}: color_data = 12'h500;
			{4'd12, 5'd2}: color_data = 12'hc01;
			{4'd12, 5'd3}: color_data = 12'he02;
			{4'd12, 5'd4}: color_data = 12'hc02;
			{4'd12, 5'd5}: color_data = 12'hd13;
			{4'd12, 5'd6}: color_data = 12'ha00;
			{4'd12, 5'd7}: color_data = 12'hf14;
			{4'd12, 5'd8}: color_data = 12'hd13;
			{4'd12, 5'd9}: color_data = 12'h000;
			{4'd12, 5'd10}: color_data = 12'h000;
			{4'd12, 5'd11}: color_data = 12'h000;
			{4'd12, 5'd12}: color_data = 12'h000;
			{4'd12, 5'd13}: color_data = 12'h382;
			{4'd12, 5'd14}: color_data = 12'h272;
			{4'd12, 5'd15}: color_data = 12'h000;
			{4'd12, 5'd16}: color_data = 12'h000;
			{4'd12, 5'd17}: color_data = 12'h000;
			{4'd12, 5'd18}: color_data = 12'h000;
			{4'd12, 5'd19}: color_data = 12'h000;
			{4'd13, 5'd0}: color_data = 12'h000;
			{4'd13, 5'd1}: color_data = 12'h000;
			{4'd13, 5'd2}: color_data = 12'ha01;
			{4'd13, 5'd3}: color_data = 12'hb01;
			{4'd13, 5'd4}: color_data = 12'hb03;
			{4'd13, 5'd5}: color_data = 12'ha01;
			{4'd13, 5'd6}: color_data = 12'he01;
			{4'd13, 5'd7}: color_data = 12'hf04;
			{4'd13, 5'd8}: color_data = 12'hd02;
			{4'd13, 5'd9}: color_data = 12'h000;
			{4'd13, 5'd10}: color_data = 12'h000;
			{4'd13, 5'd11}: color_data = 12'h000;
			{4'd13, 5'd12}: color_data = 12'h000;
			{4'd13, 5'd13}: color_data = 12'h000;
			{4'd13, 5'd14}: color_data = 12'h000;
			{4'd13, 5'd15}: color_data = 12'h000;
			{4'd13, 5'd16}: color_data = 12'h000;
			{4'd13, 5'd17}: color_data = 12'h000;
			{4'd13, 5'd18}: color_data = 12'h000;
			{4'd13, 5'd19}: color_data = 12'h000;
			{4'd14, 5'd0}: color_data = 12'h000;
			{4'd14, 5'd1}: color_data = 12'h000;
			{4'd14, 5'd2}: color_data = 12'h000;
			{4'd14, 5'd3}: color_data = 12'h000;
			{4'd14, 5'd4}: color_data = 12'h000;
			{4'd14, 5'd5}: color_data = 12'hb01;
			{4'd14, 5'd6}: color_data = 12'hd03;
			{4'd14, 5'd7}: color_data = 12'hd02;
			{4'd14, 5'd8}: color_data = 12'h901;
			{4'd14, 5'd9}: color_data = 12'h000;
			{4'd14, 5'd10}: color_data = 12'h000;
			{4'd14, 5'd11}: color_data = 12'h000;
			{4'd14, 5'd12}: color_data = 12'h000;
			{4'd14, 5'd13}: color_data = 12'h000;
			{4'd14, 5'd14}: color_data = 12'h000;
			{4'd14, 5'd15}: color_data = 12'h000;
			{4'd14, 5'd16}: color_data = 12'h000;
			{4'd14, 5'd17}: color_data = 12'h000;
			{4'd14, 5'd18}: color_data = 12'h000;
			{4'd14, 5'd19}: color_data = 12'h000;
			{4'd15, 5'd0}: color_data = 12'h000;
			{4'd15, 5'd1}: color_data = 12'h000;
			{4'd15, 5'd2}: color_data = 12'h000;
			{4'd15, 5'd3}: color_data = 12'h000;
			{4'd15, 5'd4}: color_data = 12'h000;
			{4'd15, 5'd5}: color_data = 12'h000;
			{4'd15, 5'd6}: color_data = 12'h510;
			{4'd15, 5'd7}: color_data = 12'h410;
			{4'd15, 5'd8}: color_data = 12'h000;
			{4'd15, 5'd9}: color_data = 12'h000;
			{4'd15, 5'd10}: color_data = 12'h000;
			{4'd15, 5'd11}: color_data = 12'h000;
			{4'd15, 5'd12}: color_data = 12'h000;
			{4'd15, 5'd13}: color_data = 12'h000;
			{4'd15, 5'd14}: color_data = 12'h000;
			{4'd15, 5'd15}: color_data = 12'h000;
			{4'd15, 5'd16}: color_data = 12'h000;
			{4'd15, 5'd17}: color_data = 12'h000;
			{4'd15, 5'd18}: color_data = 12'h000;
			{4'd15, 5'd19}: color_data = 12'h000;
			default: color_data =12'h3b9;
endcase
endmodule