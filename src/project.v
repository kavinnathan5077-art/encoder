module tt_um_encoder (
    input  wire [7:0] ui_in,     // 8 input pins
    output wire [7:0] uo_out,    // 8 output pins
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    reg [2:0] encoded;

    always @(*) begin
        case (ui_in)
            8'b00000001: encoded = 3'b000;
            8'b00000010: encoded = 3'b001;
            8'b00000100: encoded = 3'b010;
            8'b00001000: encoded = 3'b011;
            8'b00010000: encoded = 3'b100;
            8'b00100000: encoded = 3'b101;
            8'b01000000: encoded = 3'b110;
            8'b10000000: encoded = 3'b111;
            default:     encoded = 3'b000;
        endcase
    end

    assign uo_out = {5'b00000, encoded};

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
