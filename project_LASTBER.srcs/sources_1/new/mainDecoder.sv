`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2020 03:12:39
// Design Name: 
// Module Name: mainDecoder
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


module mainDecoder( input logic[2:0] opcode,
                   output logic memWrite, regWrite,
                   output logic alucontrol, memToReg, add, branch, halt
    );
    
    logic[6:0] controls;
    assign controls[0] = halt;
    assign controls[1] = branch;
    assign controls[2] = alucontrol;
    assign controls[3] = add;
    assign controls[4] = regWrite;
    assign controls[5] = memToReg;
    assign controls[6] = memWrite;
    //assign {memWrite, memToReg, regWrite, add, alucontrol, branch, halt } = controls;
    always_comb
        case(opcode)
            3'b000: controls <= 7'b1000000;// store value
            3'b001: controls <= 7'b0110000; // load value
            3'b010: controls <= 7'b0011000; // addition
            3'b101: controls <= 7'b0000110; // branch if equals
            3'b111: controls <= 7'b0000001; // stop execution
            default: controls <= 7'bxxxxxxx; // illegal operation( reserved)
        endcase
        
endmodule
