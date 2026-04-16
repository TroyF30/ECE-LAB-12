module one_hot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] states // Outputs A, B, C, D, E for the LEDs
);
    wire An, Bn, Cn, Dn, En;
    wire A, B, C, D, E;

    // State Storage: Only A starts as 1 (Default = 1)
    dff dffA(.Default(1'b1), .D(An), .clk(clk), .reset(reset), .Q(A));
    dff dffB(.Default(1'b0), .D(Bn), .clk(clk), .reset(reset), .Q(B));
    dff dffC(.Default(1'b0), .D(Cn), .clk(clk), .reset(reset), .Q(C));
    dff dffD(.Default(1'b0), .D(Dn), .clk(clk), .reset(reset), .Q(D));
    dff dffE(.Default(1'b0), .D(En), .clk(clk), .reset(reset), .Q(E));

    // Next State Logic from Table 8
    assign An = 1'b0;                // No transitions lead back to A
    assign Bn = ~w & (A | D | E);    // B is reached when w=0 from A, D, or E
    assign Cn = ~w & (B | C);        // C is reached when w=0 from B or C
    assign Dn =  w & (A | B | C);    // D is reached when w=1 from A, B, or C
    assign En =  w & (D | E);        // E is reached when w=1 from D or E

    assign z = C | E;
    assign states = {E, D, C, B, A}; // Grouped for the LEDs

endmodule
