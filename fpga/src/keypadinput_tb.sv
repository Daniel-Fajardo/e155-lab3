`timescale 1ns/1ns
`default_nettype none
`define N_TV 8
module keypadinput_tb();
    logic clk, reset;
    logic [3:0] row, col, hex;

    keypadinput dut(.clk(clk), .reset(reset), .row(row), .col(col), .hex(hex));

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
        row = 4'b1000; #500;
        row = 4'b0000; #300;
        row = 4'b0100; #500;
        row = 4'b0101; #200;
        row = 4'b0001; #300;
        row = 4'b0000; #200;
        row = 4'b1000; #300;
        row = 4'b1111; #200;
        row = 4'b0010; 


        end
endmodule