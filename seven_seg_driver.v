module seven_seg_driver (
    input clk, 
    input reset,                          // 1kHz or 500Hz for display refresh
    input [5:0] seconds,
    input [9:0] milliseconds,
    output reg [6:0] seg,
    output reg [3:0] an 
);
    reg [1:0] digit_select = 0;
    reg [3:0] digit_value;

    wire [3:0] sec_lsd = seconds % 10;
    wire [3:0] sec_msd = seconds / 10;

    wire [3:0] ms_lsd = (milliseconds / 10) % 10;
    wire [3:0] ms_msd = (milliseconds / 100);

    // Digit selector (refresh display multiplexing)
    always @(posedge clk or posedge reset) begin
        if (reset)
            digit_select <= 0;
        else
            digit_select <= digit_select + 1;
    end

    always @(*) begin
        case (digit_select)
            2'b00: begin an = 4'b1110; digit_value = ms_lsd; end
            2'b01: begin an = 4'b1101; digit_value = ms_msd; end
            2'b10: begin an = 4'b1011; digit_value = sec_lsd; end
            2'b11: begin an = 4'b0111; digit_value = sec_msd; end
            default: begin an = 4'b1111; digit_value = 4'b0000; end
        endcase

        case (digit_value)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule
