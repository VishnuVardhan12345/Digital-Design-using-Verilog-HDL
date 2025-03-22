module hadder (
    input A ,B,
    output sum, carry
);

    /*gate level
    xor g1(sum,A,B);
    and g2(carry,A,B);*/

    /*data flow*/
    assign sum=A^B;
    assign carry=A&B;

    /*Behavioral Modeling
    always @(*) begin
        sum=A^B;
        carry=A&B;
    end*/

endmodule
