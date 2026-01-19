module lfsr_core #(
    // default
    parameter N = 10,
    parameter [N:1] TAPS = 10'h240
) (
    input  wire clk,
    input  wire rst_n,
    output wire [N:1] q_out,
    output wire m_seq
);

    reg [N:1] q;

    wire feedback = ~(^(q & TAPS));

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= {N{1'b0}};     // all zores safe for XNOR
        end else begin
            q <= {q[N-1:1], feedback};
        end
    end

    assign q_out = q;
    assign m_seq = q[N];
    
endmodule
