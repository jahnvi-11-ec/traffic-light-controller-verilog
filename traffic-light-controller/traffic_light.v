module traffic_light(
    input clk,
    input reset,
    output reg [1:0] highway,
    output reg [1:0] side
);

parameter HG_SR = 2'b00;
parameter HY_SR = 2'b01;
parameter HR_SG = 2'b10;
parameter HR_SY = 2'b11;

reg [1:0] state, next_state;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= HG_SR;
    else
        state <= next_state;
end

always @(*)
begin
    case(state)
        HG_SR: next_state = HY_SR;
        HY_SR: next_state = HR_SG;
        HR_SG: next_state = HR_SY;
        HR_SY: next_state = HG_SR;
        default: next_state = HG_SR;
    endcase
end

always @(*)
begin
    case(state)

        HG_SR:
        begin
            highway = 2'b10;
            side    = 2'b00;
        end

        HY_SR:
        begin
            highway = 2'b01;
            side    = 2'b00;
        end

        HR_SG:
        begin
            highway = 2'b00;
            side    = 2'b10;
        end

        HR_SY:
        begin
            highway = 2'b00;
            side    = 2'b01;
        end

    endcase
end

endmodule
