 module transition_calcu_tb;
  
  parameter CLK_PERIOD = 10;
  reg CLK;
  reg Load;
  reg Clear;
  reg [9:0] Data;
  wire [5:0] Count;
  
  
  
   transition_calcu dut 
  (
    .CLK(CLK),
    .Load(Load),
    .Clear(Clear),
    .Data(Data),
    .Count(Count)
  );
  
  
  parameter PERIOD = 5;
  
  initial begin
  CLK = 0;
  forever begin
    #((PERIOD)/2) CLK = ~CLK;
  end
  end
  
   
   
   
   
   initial begin
 
    Load = 0;
    Data = 0;
    #10;
     $display("No Change Test Load =0: Count = %h", Count);
     
   end
   
   
   
   
   
   initial begin
 
    
   Clear = 0;
    Data = 3;
    #10;
   
     $display("Asynchronous Clear Test=0: Count = %h", Count);
   
   end
   
  
   
   
   
   
   
   
   
   
   
   
  
   integer i;
   initial begin
     $display("Starting testbench...");
    $dumpfile("dump.vcd");
    $dumpvars;
     
     
     
     Clear=0;
      #10;
     Clear=1;
     #10;
     
     
     for (i = 0; i < 1024; i = i + 1) begin
       
       Data=i;
       
      #10;
      Load = 1;
      #10;
      Load = 0;
      #20;
       $display("Test case for Data = %d:", Data);
      $display("Count = %d", Count);
   
      
    end
    
    
   
     
     
     
    $finish;
  end

 
 

endmodule

  
