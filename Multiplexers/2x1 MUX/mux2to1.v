module mux2to1 (
    input I0,I1,sel,
    output reg y
);
    always @(*) begin
        if (sel) begin
            y=I1;
        end else begin
            y=I0;
        end
    end
endmodule