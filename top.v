`default_nettype none

module top (
	input  clk,
    output [3:0] LED,
    input [3:0] BUTTON
);

    // on my board:
    // switch marked as S3 controls the green led 2
    // switch marked as S4 controls the blue led 1
    // dip switches don't seem to connect or control the other leds.
    assign LED = BUTTON;

endmodule
