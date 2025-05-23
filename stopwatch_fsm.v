module stopwatch_fsm (
    input clk,               // 1kHz clock
    input reset,             // Asynchronous reset
    input start_stop,        // Toggle start/pause
    input clear,             // Clear time
    output reg [5:0] seconds,
    output reg [9:0] milliseconds,
    output reg status_led    // 1 = running, 0 = paused
);

    // Verilog-style FSM state encoding
    parameter IDLE = 2'b00,
              RUNNING = 2'b01,
              PAUSED = 2'b10;

    reg [1:0] state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:    next_state = (start_stop) ? RUNNING : IDLE;
            RUNNING: next_state = (start_stop) ? PAUSED  : RUNNING;
            PAUSED:  next_state = (start_stop) ? RUNNING : PAUSED;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            seconds <= 0;
            milliseconds <= 0;
            status_led <= 0;
        end else begin
            case (state)
                RUNNING: begin
                    status_led <= 1;
                    if (milliseconds == 999) begin
                        milliseconds <= 0;
                        if (seconds == 59)
                            seconds <= 0;
                        else
                            seconds <= seconds + 1;
                    end else begin
                        milliseconds <= milliseconds + 1;
                    end
                end
                default: begin
                    status_led <= 0;
                end
            endcase

            if (clear) begin
                milliseconds <= 0;
                seconds <= 0;
            end
        end
    end

endmodule
