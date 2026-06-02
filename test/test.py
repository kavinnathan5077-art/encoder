# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):

    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.rst_n.value = 1
    dut.uio_in.value = 0

    test_vectors = [
        (0b00000001, 0),
        (0b00000010, 1),
        (0b00000100, 2),
        (0b00001000, 3),
        (0b00010000, 4),
        (0b00100000, 5),
        (0b01000000, 6),
        (0b10000000, 7),
    ]

    for inp, expected in test_vectors:
        dut.ui_in.value = inp

       await ClockCycles(dut.clk, 1)

        result = int(dut.uo_out.value) & 0x7

        dut._log.info(
            f"Input={inp:08b} Output={result:03b} Expected={expected:03b}"
        )

        assert result == expected
