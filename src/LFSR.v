`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 05:33:27 AM
// Design Name: 
// Module Name: LFSR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LFSR #(
    localparam WIDTH = 3
) (
    input clk,
    input reset_n,
    
    output reg out,
    output reg [WIDTH - 1:0] Q
);
    wire taps;
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            out <= 1'b1;
            Q <= {WIDTH{1'b1}}; // LFSR shouldn't start with 0
        end else begin
            out <= Q[0];
            Q <= {taps, Q[WIDTH - 1:1]};
        end
    end
    
    // WIDTH = 3
    assign taps = Q[2] ^ Q[1];
    
    // WIDTH = 5
    // assign taps = Q[4] ^ Q[2];
        
    // WIDTH = 8
    // assign taps = Q[7] ^ Q[5] ^ Q[4] ^ Q[3];
    
endmodule

