module stopwatch_top (
    input clk,              // 100 MHz input clock
    input reset,            // Asynchronous reset
    input start_stop,       // Toggle start/pause
    input clear,            // Clear stopwatch
    output [6:0] seg,       // 7-segment segments (a-g)
    output [3:0] an,        // 4-digit enable
    output status_led       // 1 = running, 0 = paused
);

    wire clk_1khz;
    wire [5:0] seconds;
    wire [9:0] milliseconds;

    // Clock divider: 100 MHz -> 1 kHz
    clk_divider #( 
        .DIV_VALUE(50000)  // 100 MHz / 50000 = 2 kHz (use 50_000 for 1 kHz with toggling)
    ) clk_div_inst (
        .clk_in(clk),
        .reset(reset),
        .clk_out(clk_1khz)
    );

    // FSM stopwatch logic
    stopwatch_fsm fsm_inst (
        .clk(clk_1khz),
        .reset(reset),
        .start_stop(start_stop),
        .clear(clear),
        .seconds(seconds),
        .milliseconds(milliseconds),
        .status_led(status_led)
    );

    // 7-segment display driver
    seven_seg_driver display_inst (
        .clk(clk),
        .reset(reset),
        .seconds(seconds),
        .milliseconds(milliseconds),
        .seg(seg),
        .an(an)
    );

endmodule
