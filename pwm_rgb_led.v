`timescale 1ns / 1ps

module pwm_rgb_led_tb;

    reg clk;
    reg rst_btn;
    reg [2:0] btn;
    wire led_r, led_g, led_b;

    pwm_rgb_led uut(
        .clk(clk),
        .rst_btn(rst_btn),
        .btn(btn),
        .led_r(led_r),
        .led_g(led_g),
        .led_b(led_b)
    );

    initial begin
        clk = 0;
        forever #500 clk = ~clk;
    end

    initial begin
        rst_btn = 1;
        btn = 3'b000;
        #2000;
        rst_btn = 0;

        btn = 3'b001; #1000000;
        btn = 3'b010; #1000000;
        btn = 3'b011; #1000000;
        btn = 3'b100; #1000000;
        btn = 3'b101; #1000000;
        btn = 3'b110; #1000000;
        btn = 3'b111; #1000000;

        $finish;
    end

endmodule
