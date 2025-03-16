`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 06:38:05 PM
// Design Name: 
// Module Name: i2s_loopback
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


module i2s_loopback(
    input clk,
    input LRCK_ESP32,
    input BCK_ESP32,
    input DATA_ESP32,
    output BCK_ADAU,
    output LRCK_ADAU,
    output DATA_ADAU,
    output clk_adau
    );
    assign BCK_ADAU = BCK_ESP32;
    assign LRCK_ADAU = LRCK_ESP32;
    assign DATA_ADAU = DATA_ESP32;
    assign clk_adau = clk;
endmodule
