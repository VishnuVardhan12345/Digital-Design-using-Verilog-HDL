module dl (
    input D,en,clk,
    output reg Q,Qn
);
    always @(*) begin
        if (clk) begin
            if (en) begin
                Q<=D;
                Qn<= ~D;
            end
        end
    end
endmodule