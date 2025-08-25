`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/08 15:54:56
// Design Name: 
// Module Name: LogicUnit32
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


module LogicUnit32(
    input [1:0] ALuOp,
    input [31:0] A,
    input [31:0] B,
    output [31:0] LogicResult
    );
    reg [31:0] tmp;
    always @(*) begin
        case(ALuOp)
            2'b00: tmp = A & B;
            2'b01: tmp = A | B;
            2'b10: tmp = A ^ B;
            default: tmp = ~(A | B); 
        endcase
    end
    assign LogicResult = tmp;
endmodule
