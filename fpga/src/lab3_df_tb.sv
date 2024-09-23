`timescale 1ns/1ns
`default_nettype none
`define N_TV 8
module lab3_df_tb();
    logic clk;
    logic reset;
    logic anode1, anode2;
    logic [3:0] row, col;
    logic [6:0] seg;

    top duttop(.clk(clk), .reset(reset), .row(row), .seg(seg), .anode1(anode1), .anode2(anode2), .col(col));

    initial begin
        reset = 0; #5;
        reset = 1; #5;
        end
    always begin
        clk = 1; #5;
        clk = 0; #5;
        end
    initial begin
        row = 4'b0000; #100;
        row = 4'b0001; #500;
        row = 4'b0000; #300;
        row = 4'b0100; #500;
        row = 4'b0101; #200;
        row = 4'b0001; #300;
        row = 4'b0000; #200;
        row = 4'b1000; #300;


        end
endmodule