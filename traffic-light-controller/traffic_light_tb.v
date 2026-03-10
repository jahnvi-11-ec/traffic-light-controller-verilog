`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg reset;

wire [1:0] highway;
wire [1:0] side;

traffic_light uut(
    .clk(clk),
    .reset(reset),
    .highway(highway),
    .side(side)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("dump.vcd");   // creates waveform file
    $dumpvars(0, traffic_light_tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;
    #100 $finish;
end

endmodule