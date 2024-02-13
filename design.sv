module  transition_calcu (CLK,Load,Clear,Data,Count);
input CLK,Load,Clear;
input [9:0]Data;
  output reg [5:0]Count ;
  
  always @(posedge CLK or negedge Clear) begin
    if (!Clear) begin
      Count <= 0;
    
    end else begin
      if (Load) begin
        Count <=countTransitions( Data);
      
      end
    end
  end

function automatic integer countTransitions(input[9:0]current);
    integer i;
    integer transitions;
    begin
      transitions = 0;
      for (i = 0; i < 9; i = i + 1) begin
        if (current[i] !== current[i+1]) begin
          transitions = transitions + 1;
        end
      end
      return transitions;
    end
  endfunction

endmodule
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  

