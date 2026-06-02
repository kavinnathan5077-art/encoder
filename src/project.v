module tt_um_encoder (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

reg [2:0] code;

always @(*) begin
    case (ui_in)
        8'b00000001: code = 3'd0;
        8'b00000010: code = 3'd1;
        8'b00000100: code = 3'd2;
        8'b00001000: code = 3'd3;
        8'b00010000: code = 3'd4;
        8'b00100000: code = 3'd5;
        8'b01000000: code = 3'd6;
        8'b10000000: code = 3'd7;
        default:     code = 3'd0;
    endcase
end
assign uo_out = {5'b0, code};

assign uio_out = 8'b0;
assign uio_oe  = 8'b0;

endmodule
