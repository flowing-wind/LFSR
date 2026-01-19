`timescale 1ns / 1ps

module tb_lfsr ();

    parameter N = 24;
    parameter [N:1] TAPS = 24'hE10000;

    reg clk;
    reg rst_n;
    wire [N:1] q_out;
    wire m_seq;

    lfsr_core #(
        .N (N),
        .TAPS (TAPS)
    ) dut (
        .clk (clk),
        .rst_n (rst_n),
        .q_out (q_out),
        .m_seq (m_seq)
    );

    // clk T=10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        #20;
        rst_n = 1;

        #200;
        $stop;
    end

endmodule
