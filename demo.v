module led(
    input wire clk,
    input wire rst_n,

    output wire[3:0] led_o
);

reg [30:0]  cnt;
reg [3:0] led_reg;
always@(posedge clk)
if (!rst_n) 
    cnt <= 0;
else if(cnt == 31'd24_999_999)
    cnt <= 0;
else
    cnt <= cnt + 1;

always@(posedge clk)
if(!rst_n)
    led_reg <= 4'b0001;
else if(cnt == 0)
    led_reg <= {led_reg[2:0],led_reg[3]};

assign led_o = led_reg;

endmodule