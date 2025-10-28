module dff (
    input D,clk,
    output reg Q,Qn
);
    always @(posedge clk) begin
        Q<=D;
        Qn<= ~D;
    end
endmodule