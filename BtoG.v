module BtoG (
    input B3, B2, B1 ,B0,
    output G3, G2, G1, G0
);

    /*gate level*/
    assign G3=B3;
    xor g1(G2,B3,B2);
    xor g2(G1,B2,B1);
    xor g3(G0,B1,B0);

    /*data flow
    assign G3=B3;
    assign G2=B3^B2;
    assign G1=B2^B1;
    assign G0=B1^B0;*/

    /*Behavioral Modeling
    always @(*) begin
        G3=B3;
        G2=B3^B2;
        G1=B2^B1;
        G0=B1^B0;
    end*/

endmodule

// module BtoG (
//     input [3:0]B,
//     output reg [3:0]G
// );
//     always @(*) begin
//         G[3]=B[3];
//         G[2]=B[3]^B[2];
//         G[1]=B[2]^B[1];
//         G[0]=B[1]^B[0];
//     end
// endmodule