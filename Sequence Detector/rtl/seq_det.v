//Implementation of a Sequence detector 

module seq_det(din,
               clock,
               reset,
               dout);
  
//Binary encoded state parameters
  parameter   IDLE   = 2'b0,
              STATE1 = 2'b01,
              STATE2 = 2'b10,
              STATE3 = 2'b11;     

  input  din, clock, reset;
  output dout;

        
  reg [1:0] present_state,
            next_state;

// sequential logic for present state
  always@(posedge clock)
  begin
   if (reset)
     present_state <= IDLE;
   else
     present_state <= next_state;  
  end


// combinational logic for next state
  always@(present_state,din)
  begin
    case (present_state)
      IDLE   : if (din==1) 
                   next_state=STATE1;
               else
                   next_state=IDLE;
      STATE1 : if (din==0)
                  next_state=STATE2;
               else
                  next_state=STATE1;
      STATE2 : if (din==1)
                   next_state=STATE3;
               else 
                   next_state=IDLE;
      STATE3 : if (din==1)
                   next_state=STATE1;
               else 
                   next_state=STATE2;
      default : next_state=IDLE;
    endcase
  end
  
// Output logic
  assign dout = (present_state == STATE3) ? 1 : 0;

endmodule
  

