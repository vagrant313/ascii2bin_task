`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ascii2binary();
        
        localparam DIGITS_LENGTH = 8;
        
        logic                             clk;
        logic                             rst_n;
        logic                   [(8-1):0] ascii_char_in;
        logic     [(DIGITS_LENGTH*4-1):0] binary_data_out;
        logic                             valid_in;
        logic                             busy_out;



     ascii_to_binary_converter #(.DIGITS_LENGTH(DIGITS_LENGTH)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .ascii_char_in(ascii_char_in),
        .binary_data_out(binary_data_out),
        .valid_in(valid_in),
        .busy_out(busy_out)
    );
    


    // Testbench clock generation
    always #5 clk = ~clk;

    // Testbench reset generation
    initial begin
        clk   = 0;
        rst_n = 1;
        #10 rst_n = 0;
        #10 rst_n = 1;
        // Add more test scenarios if needed
        //#100 $finish;
    end

    // Testbench stimulus

    initial begin
        valid_in = 0;
        ascii_char_in = 8'h00;
 
       if (DIGITS_LENGTH == 1) begin              
        wait(!rst_n)
        // Test case 1: ASCII input = '7' (0x37)

        repeat (1) @(posedge clk) ;
        ascii_char_in = 8'h37; 
        valid_in = 1;
        repeat (1) @(posedge clk) ; 
        valid_in = 0;  
        
        #10;
        $display("Binary output: %h, Busy: %b", binary_data_out, busy_out);
        end
       
       ////////////////////////////////////////////////////
       
      if (DIGITS_LENGTH == 2) begin              
        wait(!rst_n)
        // Test case 1: ASCII input = '78' (0x3738)

        repeat (1) @(posedge clk) ;
        ascii_char_in = 8'h37; 
        valid_in = 1;

        repeat (1) @(posedge clk) ;
        ascii_char_in = 8'h38;
        repeat (1) @(posedge clk) ;
        valid_in = 0;  
        
        #10;
        $display("Binary output: %h, Busy: %b", binary_data_out, busy_out);
        end
 

       ////////////////////////////////////////////////////
 
      if (DIGITS_LENGTH == 4) begin              
        wait(!rst_n)
        // Test case 1: ASCII input = '7' (0x37)
        repeat (1) @(posedge clk) ;
        ascii_char_in = 8'h37; 
        valid_in = 1;
        repeat (1) @(posedge clk) ; 
        
        ascii_char_in = 8'h38;
        repeat (1) @(posedge clk) ;
         
        ascii_char_in = 8'h39;
        repeat (1) @(posedge clk) ;
        
        ascii_char_in = 8'h30; 
        repeat (1) @(posedge clk) ;
        valid_in = 0;  

        repeat (1) @(posedge clk) ;
        
        #10;
        $display("Binary output: %h, Busy: %b", binary_data_out, busy_out);
        end

     ///////////////////////////////////////////////////
      if (DIGITS_LENGTH == 8) begin              
        wait(!rst_n)
        // Test case 1: ASCII input = '7' (0x37)
        repeat (1) @(posedge clk) ;

        repeat (1) @(posedge clk) ;
        ascii_char_in = 8'h39; 
        valid_in = 1;
        
        repeat (8) @(posedge clk) ;
        valid_in = 0;  

        repeat (1) @(posedge clk) ;
        
        #10;
        $display("Binary output: %h, Busy: %b", binary_data_out, busy_out);
        end


    end
    // Monitor for observing the binary output
    //always_comb
    //    #5 $display("Time: %t, Binary output: %h, Busy: %b", $time, binary_data_out, busy_out);

endmodule

