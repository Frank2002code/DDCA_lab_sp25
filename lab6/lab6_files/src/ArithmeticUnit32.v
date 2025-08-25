`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 15:55:31
// Design Name: 
// Module Name: ArithmeticUnit32
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


module ArithmeticUnit32(
    input [3:0] ALuOp,
    input [31:0] A,
    input [31:0] B,
    output [31:0] ArithmeticResult
    );
    wire [31:0] opB, AddOut;
    assign opB = ALuOp[1] ? ~B : B;
    assign AddOut = A + opB + ALuOp[1];
    assign ArithmeticResult = ALuOp[3] ? {31'b0, AddOut[31]}: AddOut; 
endmodule