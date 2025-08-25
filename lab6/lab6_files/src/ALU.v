`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 15:45:50
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALuOp,
    output zero,
    output [31:0] result
    );
    wire [31:0] ArithmeticResult, LogicResult;
    ArithmeticUnit32 arith_inst(ALuOp, A, B, ArithmeticResult);
    LogicUnit32 logic_inst(ALuOp[1:0], A, B, LogicResult);
    assign result = ALuOp[2] ? LogicResult : ArithmeticResult;
    assign zero = ~(| result);
endmodule