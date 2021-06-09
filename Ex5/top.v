//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

module aircon(clk,temperature,heating,cooling);

input clk;
input [4:0] temperature;

output heating;
output cooling;
reg heating;
reg cooling;

reg [1:0] state;
reg [1:0] next_state;

// The three states
parameter perfect=2'b00;
parameter too_cold=2'b01;
parameter too_hot=2'b10;

//Setting the current and next states

always@(posedge clk) begin

  if (next_state)
   state<=next_state;
  else begin 

  if (temperature <= 5'b10010)
  state<=too_cold;

  else if (temperature>=5'b10110)
  state<=too_hot;

  else 
  state<=perfect;
 
  end 
  
end

// Output based on current state

always@(state or temperature) begin 
 case(state)
  too_hot: begin
   {heating,cooling}=2'b01;
  end
 
  perfect: begin
   {heating,cooling}=2'b00;
  end
  
  too_cold: begin
   {heating,cooling}=2'b10;
  end
  
  default: begin
 {heating,cooling} = 2'b00;
  end
 endcase
end

// Next_state

always@(state or temperature) begin
 case(state)
  too_hot: begin
   next_state = (temperature>5'b10100)?too_hot:perfect;
  end
  
  perfect: begin
   if (temperature>=5'b10110) begin
    next_state=too_hot;
   end
   
   else if (temperature<=5'b10010) begin
    next_state=too_cold;
   end
  end 

  too_cold: begin 
   next_state=(temperature<5'b10100)?too_cold:perfect;
  end 

  default: begin
   next_state=perfect;
  end
 endcase
end

endmodule
 
 











