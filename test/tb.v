`timescale 1ns/1ps

module tb;

    reg [7:0] ui_in;
    wire [7:0] uo_out;

    reg [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    reg clk;
    reg rst_n;
    reg ena;

    tt_um_encoder dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        ena = 1;
        rst_n = 1;
        uio_in = 0;

        ui_in = 8'b00000001; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b00000010; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b00000100; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b00001000; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b00010000; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b00100000; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b01000000; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        ui_in = 8'b10000000; #10;
        $display("Input=%b Output=%b", ui_in, uo_out);

        $finish;
    end

endmodule
