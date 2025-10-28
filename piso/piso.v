module dff (
    input wire D,       
    input wire clk,   
    input wire rst,
    output reg Q        
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q = 0;
    end
    else begin
        Q = D;
    end
end

endmodule

module piso(q1,q2,q3,load,clk,rst,o);
      input q1,q2,q3,load,clk,rst;
      output o;
      wire p,r,s,t,u,v,w,x,y;
      and a0(p,load,q1);
      dff a1(p,clk,rst,r);
      and a2(s,r,~load);
      and a3(t,q2,load);
      or  a4(u,s,t);
      dff a5(u,clk,rst,v);
        and a6(w,v,~load);
          and a7(x,q3,load);
          or  a8(y,x,w);
      dff a9(y,clk,rst,o);
endmodule



// module dff (
//     input D,clk,rst,
//     output reg Q,Qn
// );
//     always @(posedge clk) begin
//         if (rst) begin
//             Q<=0;
//             Qn<=1;
//         end else begin
//             Q<=D;
//             Qn<= ~D;
//         end
//     end
// endmodule

// module piso (
//     input clk,
//     input load,
//     input [3:0] p,
//     input rst,
//     output serial_out
// );
//     wire [3:0] d;
//     wire [3:0] q;

//     dff dff0 (.clk(clk), .D(d[0]), .rst(rst), .Q(q[0]));
//     dff dff1 (.clk(clk), .D(d[1]), .rst(rst), .Q(q[1]));
//     dff dff2 (.clk(clk), .D(d[2]), .rst(rst), .Q(q[2]));
//     dff dff3 (.clk(clk), .D(d[3]), .rst(rst), .Q(q[3]));

//     assign d[0] = load ? p[0] : (q[1]);
//     assign d[1] = load ? p[1] : (q[2]);
//     assign d[2] = load ? p[2] : (q[3]);
//     assign d[3] = load ? p[3] : (1'b0);

//     assign serial_out = q[3];

// endmodule



