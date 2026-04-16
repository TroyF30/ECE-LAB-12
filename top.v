module top(
    input [0:0] sw,    // sw[0] = w
    input btnC,        // Clock
    input btnU,        // Reset
    output [9:0] led   // LED bus 0-9
);
    
    // Wire up the One-Hot module
    one_hot oh_inst (
        .w(sw[0]),
        .clk(btnC),
        .reset(btnU),
        .z(led[0]),
        .states(led[6:2]) // led[2]=A, [3]=B, [4]=C, [5]=D, [6]=E
    );

    // Wire up Binary module
    binary bin_inst (
        .w(sw[0]),
        .clk(btnC),
        .reset(btnU),
        .z(led[1]),
        .state_out(led[9:7])
    );

endmodule
