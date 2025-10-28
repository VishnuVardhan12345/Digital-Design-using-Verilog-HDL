module sr (
    input S,R,en,clk,
    output reg Q,Qn
);
    always @(*) begin
        if (clk) begin
            if (en) begin
                if (S&&~R) begin
                    Q<=1;
                    Qn<=0;
                end
                if (~S&&R) begin
                    Q<=0;
                    Qn<=1;
                end
                if (S&&R) begin
                    $finish;
                end
            end
        end
    end
endmodule