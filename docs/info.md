<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements an 8-to-3 binary encoder using combinational logic.

The encoder accepts 8 input signals through the Tiny Tapeout input pins (ui_in[7:0]). Only one input should be HIGH at a time. The encoder converts the active input line into a 3-bit binary code.

Input to Output Mapping:

| Active Input | Binary Output |
|-------------|--------------|
| ui_in[0]    | 000          |
| ui_in[1]    | 001          |
| ui_in[2]    | 010          |
| ui_in[3]    | 011          |
| ui_in[4]    | 100          |
| ui_in[5]    | 101          |
| ui_in[6]    | 110          |
| ui_in[7]    | 111          |

The encoded output is available on:
- uo_out[2:0] → Encoded binary value

The remaining output pins (uo_out[7:3]) are unused and remain LOW.

This design is purely combinational and does not require a clock signal.

## How to test

1. Apply a single HIGH signal to one of the input pins ui_in[7:0].
2. Ensure all other input pins remain LOW.
3. Observe the output pins uo_out[2:0].
4. The output should represent the binary index of the active input.

Examples:

- ui_in = 00000001 → uo_out[2:0] = 000
- ui_in = 00000010 → uo_out[2:0] = 001
- ui_in = 00000100 → uo_out[2:0] = 010
- ui_in = 00001000 → uo_out[2:0] = 011
- ui_in = 00010000 → uo_out[2:0] = 100
- ui_in = 00100000 → uo_out[2:0] = 101
- ui_in = 01000000 → uo_out[2:0] = 110
- ui_in = 10000000 → uo_out[2:0] = 111

For valid operation, only one input should be asserted at a time.

## External hardware

No external hardware is required.

Optional hardware for demonstration:
- LEDs connected to output pins uo_out[2:0]
- Switches connected to input pins ui_in[7:0]
