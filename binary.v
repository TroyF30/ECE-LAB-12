module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state_out
);
    wire [2:0] curr;
    wire [2:0] next;

    dff b0(.Default(1'b0), .D(next[0]), .clk(clk), .reset(reset), .Q(curr[0]));
    dff b1(.Default(1'b0), .D(next[1]), .clk(clk), .reset(reset), .Q(curr[1]));
    dff b2(.Default(1'b0), .D(next[2]), .clk(clk), .reset(reset), .Q(curr[2]));

    assign next[0] = (~w & (curr == 3'b000 || curr == 3'b011 || curr == 3'b100)) | 
                     ( w & (curr == 3'b000 || curr == 3'b001 || curr == 3'b010));

    assign next[1] = (~w & (curr == 3'b001 || curr == 3'b010)) | 
                     ( w & (curr == 3'b000 || curr == 3'b001 || curr == 3'b010));

    assign next[2] = ( w & (curr == 3'b011 || curr == 3'b100));

    // Output Z is high in state C(010) and E(100)
    assign z = (curr == 3'b010) | (curr == 3'b100);
    assign state_out = curr;

endmodule
