`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2025 05:52:20 AM
// Design Name: 
// Module Name: LFSR_tb
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


module LFSR_tb;
    
    localparam WIDTH = 3;
    
    reg clk;
    reg reset_n;
    wire out;
    wire [WIDTH - 1:0] Q;
    
    // Instantiate the LFSR module
    LFSR #(WIDTH) uut (
        .clk(clk),
        .reset_n(reset_n),
        .out(out),
        .Q(Q)
    );
    
    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period
    
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;
        
        // Apply reset
        #10 reset_n = 1;
        
        // Run for some cycles
        #100;
        
        // Stop simulation
        $stop;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time = %0t | Q = %b | out = %b", $time, Q, out);
    end
    
endmodule
