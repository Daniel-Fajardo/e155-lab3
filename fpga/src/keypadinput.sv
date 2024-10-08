// Daniel Fajardo
// dfajardo@g.hmc.edu
// 09/22/2024
//
// the fsm for sensing a button push on the keypad
module keypadinput(
    input logic clk,
    input logic reset,
    input logic [3:0] row,
    output logic [3:0] col,
    output logic [3:0] hex,
    output logic hexen, colen
);
    logic [3:0] state, nextstate;

    always_ff @(posedge clk)
	    if (!reset) begin state <= 4'b0000;
            //col <= 4'b0001;
            //hex <= 4'b0000;
            end
	    else state <= nextstate;
    
    // nextstate logic
    always_comb
        case (state)
            // cases 0-3 cycles through turning each col on and checking if any row is on
            0: if (~(row[0]|row[1]|row[2]|row[3])) nextstate <= 1;
                else nextstate <= 4;
            1: if (~(row[0]|row[1]|row[2]|row[3])) nextstate <= 2;
                else nextstate <= 5;
            2: if (~(row[0]|row[1]|row[2]|row[3])) nextstate <= 3;
                else nextstate <= 6;
            3: if (~(row[0]|row[1]|row[2]|row[3])) nextstate <= 0;
                else nextstate <= 7;
            // cases 4-7 cycle through rows to see which is on and then sets the hex value
            4: if (row[0]) nextstate <= 8;
                else if (row[1]) nextstate <= 9;
                else if (row[2]) nextstate <= 10;
                else if (row[3]) nextstate <= 11;
                else nextstate <= 0;
            5: if (row[0]) nextstate <= 8;
                else if (row[1]) nextstate <= 9;
                else if (row[2]) nextstate <= 10;
                else if (row[3]) nextstate <= 11;
                else nextstate <= 0;
            6: if (row[0]) nextstate <= 8;
                else if (row[1]) nextstate <= 9;
                else if (row[2]) nextstate <= 10;
                else if (row[3]) nextstate <= 11;
                else nextstate <= 0;
            7: if (row[0]) nextstate <= 8;
                else if (row[1]) nextstate <= 9;
                else if (row[2]) nextstate <= 10;
                else if (row[3]) nextstate <= 11;
                else nextstate <= 0;
            // hold state, if row is same as it was previously
            8: if (row[0]) nextstate <= 8;
                else nextstate <= 0;
            9: if (row[1]) nextstate <= 9;
                else nextstate <= 0;
            10: if (row[2]) nextstate <= 10;
                else nextstate <= 0;
            11: if (row[3]) nextstate <= 11;
                else nextstate <= 0;
            default: nextstate <= 0;
        endcase

    // output logic
    always_comb
        case (state)
            // cases 0-3 cycles through turning each col on and checking if any row is on
            0: begin col <= 4'b0001; 
                hex <= 4'b0000; end // not enabled
            1: begin col <= 4'b0010;
                hex <= 4'b0000; end // not enabled
            2: begin col <= 4'b0100; 
                hex <= 4'b0000; end // not enabled
            3: begin col <= 4'b1000;
                hex <= 4'b0000; end // not enabled
            // cases 4-7 cycle through rows to see which is on and then sets the hex value
            4: if (row[0]) begin hex <= 4'b1010; // A
                    col <= 4'b0001; end
                else if (row[1]) begin hex <= 4'b0111; // 7
                    col <= 4'b0001; end
                else if (row[2]) begin hex <= 4'b0100; // 4
                    col <= 4'b0001; end
                else if (row[3]) begin hex <= 4'b0001; // 1
                    col <= 4'b0001; end
                else begin hex <= 4'b0000;
                    col <= 4'b0001; end
            5: if (row[0]) begin hex <= 4'b0000; // 0
                    col <= 4'b0010; end
                else if (row[1]) begin hex <= 4'b1000; // 8
                    col <= 4'b0010; end
                else if (row[2]) begin hex <= 4'b0101; // 5
                    col <= 4'b0010; end
                else if (row[3]) begin hex <= 4'b0010; // 2
                    col <= 4'b0010; end
                else begin hex <= 4'b0000;
                    col <= 4'b0010; end
            6: if (row[0]) begin hex <= 4'b1011; // B
                    col <= 4'b0100; end
                else if (row[1]) begin hex <= 4'b1001; // 9
                    col <= 4'b0100; end
                else if (row[2]) begin hex <= 4'b0110; // 6
                    col <= 4'b0100; end
                else if (row[3]) begin hex <= 4'b0011; // 3
                    col <= 4'b0100; end
                else begin hex <= 4'b0000;
                    col <= 4'b0100; end
            7: if (row[0]) begin hex <= 4'b1111; // F
                    col <= 4'b1000; end
                else if (row[1]) begin hex <= 4'b1110; // E
                    col <= 4'b1000; end
                else if (row[2]) begin hex <= 4'b1101; // D
                    col <= 4'b1000; end
                else if (row[3]) begin hex <= 4'b1100; // C
                    col <= 4'b1000; end
                else begin hex <= 4'b0000;
                    col <= 4'b1000; end
            // hold state, if row is same as it was previously
            8: begin hex <= 4'b0000; // not enabled
                col <= 4'b1111; end
            9: begin hex <= 4'b0000; // not enabled
                col <= 4'b1111; end
            10: begin hex <= 4'b0000; // not enabled
                col <= 4'b1111; end
            11: begin hex <= 4'b0000; // not enabled
                col <= 4'b1111; end
            default: begin hex <= 4'b0000;
                col <= 4'b0001; end
        endcase

    // enables hex output to be read. Used to avoid latches
    always_comb
        case(state)
            0: hexen <= 0;
            1: hexen <= 0;
            2: hexen <= 0;
            3: hexen <= 0;
            4: hexen <= 1;
            5: hexen <= 1;
            6: hexen <= 1;
            7: hexen <= 1;
            8: hexen <= 0;
            9: hexen <= 0;
            10: hexen <= 0;
            11: hexen <= 0;
            default: hexen <= 0;
        endcase

endmodule