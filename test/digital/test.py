# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer


@cocotb.test()
async def test_sar_clocks_frame(dut):
    """Verify 4 MHz 10-cycle frame: P0 sample, 8x 50%-duty clk_sar in P1-P8, P9 output capture."""
    dut._log.info("Starting 4 MHz clock (250 ns period)")
    clock = Clock(dut.clk, 250, unit="ns")
    cocotb.start_soon(clock.start())

    # Apply active-low reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await Timer(300, unit="ns")
    await FallingEdge(dut.clk)
    dut.rst_n.value = 1

    # Align to the first rising edge after reset (enters P0)
    await RisingEdge(dut.clk)

    # Verify 3 full 10-cycle frames (30 cycles total)
    for frame in range(3):
        for cycle in range(10):
            # --- Check FIRST HALF of clock cycle (clk == 1) ---
            await Timer(10, unit="ns")
            out_val  = int(dut.uio_out.value)
            clk_sh   = (out_val >> 0) & 1
            clk_sar  = (out_val >> 1) & 1
            rst      = (out_val >> 2) & 1
            clk_door = (out_val >> 3) & 1

            if cycle == 0:          # P0: Sample + SAR reset
                assert (clk_sh, clk_sar, rst, clk_door) == (1, 0, 1, 0), \
                    f"Frame {frame} P0 high-half mismatch: sh={clk_sh} sar={clk_sar} rst={rst} door={clk_door}"
            elif 1 <= cycle <= 8:   # P1-P8: 8 conversion pulses
                assert (clk_sh, clk_sar, rst, clk_door) == (0, 1, 0, 0), \
                    f"Frame {frame} P{cycle} high-half mismatch: sh={clk_sh} sar={clk_sar} rst={rst} door={clk_door}"
            elif cycle == 9:        # P9: Output register latch
                assert (clk_sh, clk_sar, rst, clk_door) == (0, 0, 0, 1), \
                    f"Frame {frame} P9 high-half mismatch: sh={clk_sh} sar={clk_sar} rst={rst} door={clk_door}"

            # --- Check SECOND HALF of clock cycle (clk == 0) ---
            await FallingEdge(dut.clk)
            await Timer(10, unit="ns")
            clk_sar_low = (int(dut.uio_out.value) >> 1) & 1
            assert clk_sar_low == 0, \
                f"Frame {frame} P{cycle}: clk_sar stayed high during low half of clk (not 50% duty cycle!)"

            await RisingEdge(dut.clk)

    dut._log.info("All 3 frames (30 cycles) passed!")