module clk_divider #(
    parameter DIV_VALUE = 50000  // Divide by 50,000 → 1kHz from 100MHz
)(
    input clk_in,         // 100 MHz input clock
    input reset,
    output reg clk_out    // Output clock
);
    reg [31:0] count = 0;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_out <= 0;
        end else begin
            if (count == (DIV_VALUE - 1)) begin
                count <= 0;
                clk_out <= ~clk_out;
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule
