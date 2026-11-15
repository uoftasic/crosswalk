/*
 * Copyright (c) 2024 UofT ASIC
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_uoftasic_crosswalk_digital (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs (reserved for D[7:0])
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // 4 MHz clock (clk_in)
    input  wire       rst_n     // reset_n - low to reset
);

    wire clk_sh;
    wire clk_sar;
    wire rst;
    wire clk_door;

    sar_clocks u_sar_clocks (
        .clk_in   (clk),
        .rst_n    (rst_n),
        .clk_sh   (clk_sh),
        .clk_sar  (clk_sar),
        .rst      (rst),
        .clk_door (clk_door)
    );

    // Output register D[7:0] will drive uo_out once integrated
    assign uo_out  = 8'b0000_0000;

    // Expose clock/control signals on bidirectional output pins [3:0]
    assign uio_out = {4'b0000, clk_door, rst, clk_sar, clk_sh};
    assign uio_oe  = 8'b0000_1111;

    // List all unused inputs to prevent synthesis warnings
    wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule