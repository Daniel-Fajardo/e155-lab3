module keypadinput(
    input logic clk,
    input logic reset,
    input logic [3:0] row,
    output logic [3:0] col,
    output logic [3:0] hex
);
    logic [3:0] state, nextstate;
    // logic [3:0] prev;

    always_ff @(posedge clk, posedge reset)
	    if (reset) begin state <= 4'b0000;
            // col <= 4'b0001;
            end
	    else state <= nextstate;

    always_comb
        case (state)
            // cases 0-3 cycles through turning each col on and checking if any row is on
            0: if (~(row[0]|row[1]|row[2]|row[3])) begin 
                    nextstate <= 1;
                    col <= 4'b0010; end
                else nextstate <= 4;
            1: if (~(row[0]|row[1]|row[2]|row[3])) begin 
                    nextstate <= 2;
                    col <= 4'b0100; end
                else nextstate <= 5;
            2: if (~(row[0]|row[1]|row[2]|row[3])) begin 
                    nextstate <= 3;
                    col <= 4'b1000; end
                else nextstate <= 6;
            3: if (~(row[0]|row[1]|row[2]|row[3])) begin 
                    nextstate <= 0;
                    col <= 4'b0001; end
                else nextstate <= 7;
            // cases 4-7 cycle through rows to see which is on and then sets the hex value
            4: if (row[0]) begin hex <= 4'b1010; // A
                    nextstate <= 8; end
                else if (row[1]) begin hex <= 4'b0111; // 7
                    nextstate <= 9; end
                else if (row[2]) begin hex <= 4'b0100; // 4
                    nextstate <= 10; end
                else if (row[3]) begin hex <= 4'b0001; // 1
                    nextstate <= 11; end
                else begin hex <= 4'bxxxx;
                    nextstate <= 0; end
            5: if (row[0]) begin hex <= 4'b0000; // 0
                    nextstate <= 8; end
                else if (row[1]) begin hex <= 4'b1000; // 8
                    nextstate <= 9; end
                else if (row[2]) begin hex <= 4'b0101; // 5
                    nextstate <= 10; end
                else if (row[3]) begin hex <= 4'b0010; // 2
                    nextstate <= 11; end
                else begin hex <= 4'bxxxx;
                    nextstate <= 0; end
            6: if (row[0]) begin hex <= 4'b1011; // B
                    nextstate <= 8; end
                else if (row[1]) begin hex <= 4'b1001; // 9
                    nextstate <= 9; end
                else if (row[2]) begin hex <= 4'b0110; // 6
                    nextstate <= 10; end
                else if (row[3]) begin hex <= 4'b0011; // 3
                    nextstate <= 11; end
                else begin hex <= 4'bxxxx;
                    nextstate <= 0; end
            7: if (row[0]) begin hex <= 4'b1111; // F
                    nextstate <= 8; end
                else if (row[1]) begin hex <= 4'b1110; // E
                    nextstate <= 9; end
                else if (row[2]) begin hex <= 4'b1101; // D
                    nextstate <= 10; end
                else if (row[3]) begin hex <= 4'b1100; // C
                    nextstate <= 11; end
                else begin hex <= 4'bxxxx;
                    nextstate <= 0; end
            // hold state, if row is same as it was previously
            8: if (row[0]) nextstate <= 8;
                else nextstate <= 0;
            9: if (row[1]) nextstate <= 9;
                else nextstate <= 0;
            10: if (row[2]) nextstate <= 10;
                else nextstate <= 0;
            11: if (row[3]) nextstate <= 11;
                else nextstate <= 0;
            /* if (prev[0]&row[0]) nextstate <= 5;
                else if (prev[1]&row[1]) nextstate <= 5;
                else if (prev[2]&row[2]) nextstate <= 5;
                else if (prev[3]&row[3]) nextstate <= 5;
                else nextstate <= 0;*/
            default: nextstate <= 0;

            // case 5 will hold until the current button is released

        endcase







/*                if (c0) begin 
                    if (r0) hex <= 4'b1010;
                    else if (r1) hex <= 4'b0111;
                    else if (r2) hex <= 4'b0100;
                    else if (r3) hex <= 4'b0001;
                    else hex <= 4'b0000;
                    c0 <= 0;
                    c1 <= 1;
                    end
                else if (c1) begin*/



    
/*    always_comb
        case (key)
            8'b10010000: hex <= 4'b0000; // 0
            8'b01000010: hex <= 4'b0001; // 1
            8'b00010010: hex <= 4'b0010; // 2
            8'b00000110: hex <= 4'b0011; // 3
            8'b01001000: hex <= 4'b0100; // 4
            8'b00011000: hex <= 4'b0101; // 5
            8'b00001100: hex <= 4'b0110; // 6
            8'b01100000: hex <= 4'b0111; // 7

            8'b00110000: hex <= 4'b1000; // 8
            8'b00100100: hex <= 4'b1001; // 9
            8'b11000000: hex <= 4'b1010; // A
            8'b10000100: hex <= 4'b1011; // B
            8'b00000011: hex <= 4'b1100; // C
            8'b00001001: hex <= 4'b1101; // D
            8'b00100001: hex <= 4'b1110; // E
            8'b10000001: hex <= 4'b1111; // F
            default: hex <= 4'b0000;
        endcase
*/
endmodule