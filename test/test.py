@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    clock = Clock(dut.clk, 10, unit="us")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0

    await ClockCycles(dut.clk, 10)

    dut.rst_n.value = 1

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

        assert dut.uo_out.value.integer == expected, \
            f"Input={inp:08b} Expected={expected} Got={dut.uo_out.value.integer}"
