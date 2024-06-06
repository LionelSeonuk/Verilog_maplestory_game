module monsterskil12_rom(
        input wire clk,
        input wire [3:0] x,
        input wire [3:0] y,
        output reg [11:0] color_data
);

    (* rom_style = "block" *)

    //signal declaration
    reg [3:0] x_reg;
    reg [3:0] y_reg;

    always @(posedge clk) begin
        x_reg <= x;
        y_reg <= y;
    end

    always @*
        case ({x_reg, y_reg})	
						// right: 4'd14, bottom: 4'd9
			{4'd0, 4'd0}: color_data = 12'h000;
			{4'd0, 4'd1}: color_data = 12'h200;
			{4'd0, 4'd2}: color_data = 12'ha41;
			{4'd0, 4'd3}: color_data = 12'hc72;
			{4'd0, 4'd4}: color_data = 12'heb5;
			{4'd0, 4'd5}: color_data = 12'hcb6;
			{4'd0, 4'd6}: color_data = 12'hba7;
			{4'd0, 4'd7}: color_data = 12'hcb7;
			{4'd0, 4'd8}: color_data = 12'h000;
			{4'd0, 4'd9}: color_data = 12'h000;
			{4'd1, 4'd0}: color_data = 12'hb82;
			{4'd1, 4'd1}: color_data = 12'hc51;
			{4'd1, 4'd2}: color_data = 12'hc62;
			{4'd1, 4'd3}: color_data = 12'hfc5;
			{4'd1, 4'd4}: color_data = 12'heb6;
			{4'd1, 4'd5}: color_data = 12'hff9;
			{4'd1, 4'd6}: color_data = 12'hffb;
			{4'd1, 4'd7}: color_data = 12'hffa;
			{4'd1, 4'd8}: color_data = 12'hdb6;
			{4'd1, 4'd9}: color_data = 12'h741;
			{4'd2, 4'd0}: color_data = 12'hea2;
			{4'd2, 4'd1}: color_data = 12'he61;
			{4'd2, 4'd2}: color_data = 12'he84;
			{4'd2, 4'd3}: color_data = 12'hd84;
			{4'd2, 4'd4}: color_data = 12'hea5;
			{4'd2, 4'd5}: color_data = 12'hff8;
			{4'd2, 4'd6}: color_data = 12'hfd8;
			{4'd2, 4'd7}: color_data = 12'hffa;
			{4'd2, 4'd8}: color_data = 12'heb6;
			{4'd2, 4'd9}: color_data = 12'ha41;
			{4'd3, 4'd0}: color_data = 12'hc92;
			{4'd3, 4'd1}: color_data = 12'hd61;
			{4'd3, 4'd2}: color_data = 12'he63;
			{4'd3, 4'd3}: color_data = 12'he53;
			{4'd3, 4'd4}: color_data = 12'hfda;
			{4'd3, 4'd5}: color_data = 12'hfc7;
			{4'd3, 4'd6}: color_data = 12'hea6;
			{4'd3, 4'd7}: color_data = 12'hfe9;
			{4'd3, 4'd8}: color_data = 12'hd84;
			{4'd3, 4'd9}: color_data = 12'ha20;
			{4'd4, 4'd0}: color_data = 12'hdb2;
			{4'd4, 4'd1}: color_data = 12'he91;
			{4'd4, 4'd2}: color_data = 12'he50;
			{4'd4, 4'd3}: color_data = 12'he63;
			{4'd4, 4'd4}: color_data = 12'hfea;
			{4'd4, 4'd5}: color_data = 12'he75;
			{4'd4, 4'd6}: color_data = 12'he84;
			{4'd4, 4'd7}: color_data = 12'hfe9;
			{4'd4, 4'd8}: color_data = 12'hc52;
			{4'd4, 4'd9}: color_data = 12'h910;
			{4'd5, 4'd0}: color_data = 12'hfd2;
			{4'd5, 4'd1}: color_data = 12'hfb0;
			{4'd5, 4'd2}: color_data = 12'hf60;
			{4'd5, 4'd3}: color_data = 12'he52;
			{4'd5, 4'd4}: color_data = 12'hfc7;
			{4'd5, 4'd5}: color_data = 12'he41;
			{4'd5, 4'd6}: color_data = 12'he63;
			{4'd5, 4'd7}: color_data = 12'he84;
			{4'd5, 4'd8}: color_data = 12'hd41;
			{4'd5, 4'd9}: color_data = 12'h941;
			{4'd6, 4'd0}: color_data = 12'hfc2;
			{4'd6, 4'd1}: color_data = 12'hc90;
			{4'd6, 4'd2}: color_data = 12'he80;
			{4'd6, 4'd3}: color_data = 12'he40;
			{4'd6, 4'd4}: color_data = 12'hf52;
			{4'd6, 4'd5}: color_data = 12'he20;
			{4'd6, 4'd6}: color_data = 12'he30;
			{4'd6, 4'd7}: color_data = 12'hd40;
			{4'd6, 4'd8}: color_data = 12'hd62;
			{4'd6, 4'd9}: color_data = 12'h651;
			{4'd7, 4'd0}: color_data = 12'h000;
			{4'd7, 4'd1}: color_data = 12'hc91;
			{4'd7, 4'd2}: color_data = 12'hfc1;
			{4'd7, 4'd3}: color_data = 12'hf80;
			{4'd7, 4'd4}: color_data = 12'he20;
			{4'd7, 4'd5}: color_data = 12'hf50;
			{4'd7, 4'd6}: color_data = 12'hd40;
			{4'd7, 4'd7}: color_data = 12'hc81;
			{4'd7, 4'd8}: color_data = 12'hda3;
			{4'd7, 4'd9}: color_data = 12'h000;
			{4'd8, 4'd0}: color_data = 12'h000;
			{4'd8, 4'd1}: color_data = 12'hed2;
			{4'd8, 4'd2}: color_data = 12'hed1;
			{4'd8, 4'd3}: color_data = 12'hda1;
			{4'd8, 4'd4}: color_data = 12'hd60;
			{4'd8, 4'd5}: color_data = 12'hfa0;
			{4'd8, 4'd6}: color_data = 12'hc71;
			{4'd8, 4'd7}: color_data = 12'hba3;
			{4'd8, 4'd8}: color_data = 12'hdd3;
			{4'd8, 4'd9}: color_data = 12'h000;
			{4'd9, 4'd0}: color_data = 12'h000;
			{4'd9, 4'd1}: color_data = 12'haa3;
			{4'd9, 4'd2}: color_data = 12'hcb2;
			{4'd9, 4'd3}: color_data = 12'h982;
			{4'd9, 4'd4}: color_data = 12'hdb1;
			{4'd9, 4'd5}: color_data = 12'hec1;
			{4'd9, 4'd6}: color_data = 12'hc91;
			{4'd9, 4'd7}: color_data = 12'hba5;
			{4'd9, 4'd8}: color_data = 12'hcc6;
			{4'd9, 4'd9}: color_data = 12'h000;
			{4'd10, 4'd0}: color_data = 12'h000;
			{4'd10, 4'd1}: color_data = 12'hba4;
			{4'd10, 4'd2}: color_data = 12'ha93;
			{4'd10, 4'd3}: color_data = 12'h000;
			{4'd10, 4'd4}: color_data = 12'hdd2;
			{4'd10, 4'd5}: color_data = 12'hdc2;
			{4'd10, 4'd6}: color_data = 12'hba2;
			{4'd10, 4'd7}: color_data = 12'h896;
			{4'd10, 4'd8}: color_data = 12'h000;
			{4'd10, 4'd9}: color_data = 12'h000;
			{4'd11, 4'd0}: color_data = 12'h000;
			{4'd11, 4'd1}: color_data = 12'h000;
			{4'd11, 4'd2}: color_data = 12'h000;
			{4'd11, 4'd3}: color_data = 12'h000;
			{4'd11, 4'd4}: color_data = 12'hdc2;
			{4'd11, 4'd5}: color_data = 12'hdc2;
			{4'd11, 4'd6}: color_data = 12'h000;
			{4'd11, 4'd7}: color_data = 12'h000;
			{4'd11, 4'd8}: color_data = 12'h000;
			{4'd11, 4'd9}: color_data = 12'h000;
			{4'd12, 4'd0}: color_data = 12'h000;
			{4'd12, 4'd1}: color_data = 12'h000;
			{4'd12, 4'd2}: color_data = 12'h000;
			{4'd12, 4'd3}: color_data = 12'h000;
			{4'd12, 4'd4}: color_data = 12'h000;
			{4'd12, 4'd5}: color_data = 12'h000;
			{4'd12, 4'd6}: color_data = 12'h000;
			{4'd12, 4'd7}: color_data = 12'h000;
			{4'd12, 4'd8}: color_data = 12'h000;
			{4'd12, 4'd9}: color_data = 12'h000;
			{4'd13, 4'd0}: color_data = 12'h000;
			{4'd13, 4'd1}: color_data = 12'h000;
			{4'd13, 4'd2}: color_data = 12'h000;
			{4'd13, 4'd3}: color_data = 12'h000;
			{4'd13, 4'd4}: color_data = 12'h000;
			{4'd13, 4'd5}: color_data = 12'h000;
			{4'd13, 4'd6}: color_data = 12'h000;
			{4'd13, 4'd7}: color_data = 12'h000;
			{4'd13, 4'd8}: color_data = 12'h000;
			{4'd13, 4'd9}: color_data = 12'h000;
			{4'd14, 4'd0}: color_data = 12'h000;
			{4'd14, 4'd1}: color_data = 12'h000;
			{4'd14, 4'd2}: color_data = 12'h000;
			{4'd14, 4'd3}: color_data = 12'h000;
			{4'd14, 4'd4}: color_data = 12'h000;
			{4'd14, 4'd5}: color_data = 12'h000;
			{4'd14, 4'd6}: color_data = 12'h000;
			{4'd14, 4'd7}: color_data = 12'h000;
			{4'd14, 4'd8}: color_data = 12'h000;
			{4'd14, 4'd9}: color_data = 12'h000;
default: color_data =12'h000;
endcase
endmodule