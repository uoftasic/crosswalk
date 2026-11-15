`default_nettype none

module sar_clocks (
    input  wire clk_in,    // 4 MHz master clock (250 ns period)
    input  wire rst_n,     // Active-low global reset
    output reg  clk_sh,    // Sample/Hold control (active high in P0)
    output wire clk_sar,   // 50% duty-cycle gated clock (8 pulses in P1-P8)
    output reg  rst,       // Active-high frame reset to SAR logic (active in P0)
    output reg  clk_door   // Glitch-free latch clock for Output Register (active in P9)
);

    reg [3:0] count;
    reg [3:0] next_count;
    reg       sar_en;
    reg       sar_en_latched;

    // Modulo-10 counter next-state logic (P0 = 0 ... P9 = 9)
    always @(*) begin
        if (count >= 4'd9) begin
            next_count = 4'd0;
        end else begin
            next_count = count + 4'd1;
        end
    end

    // Synchronous state and lookahead-registered control outputs
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            count    <= 4'd9; // Hold at P9 during reset so first posedge enters P0
            clk_sh   <= 1'b0;
            rst      <= 1'b1; // Keep SAR logic held in reset until P0 completes
            sar_en   <= 1'b0;
            clk_door <= 1'b0;
        end else begin
            count    <= next_count;
            clk_sh   <= (next_count == 4'd0); // High during P0
            rst      <= (next_count == 4'd0); // High during P0
            sar_en   <= (next_count <= 4'd7); // Arms latch in P0..P7 so clk_sar pulses in P1..P8
            clk_door <= (next_count == 4'd9); // High during P9 (glitch-free)
        end
    end

    // Integrated Clock Gating (ICG) latch: transparent only when clk_in is LOW
    /* verilator lint_off LATCH */
    always @(*) begin
        if (!clk_in) begin
            sar_en_latched = sar_en;
        end
    end
    /* verilator lint_on LATCH */

    assign clk_sar = clk_in & sar_en_latched;

endmodule