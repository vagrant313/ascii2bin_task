`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////


module bcd_to_bin #(parameter BCD_DIGIT = 8) (
  input  logic                     clk,
  
  input  logic [(BCD_DIGIT*4)-1:0] bcd_in,
  output logic [(BCD_DIGIT*4)-1:0] binary_out
);

  //-----------------------
  // wire and regs
  //-----------------------

  logic [31:0] ones             ; // Digit 0
  logic [31:0] tens             ; // Digit 1
  logic [31:0] hundreds         ; // Digit 2
  logic [31:0] thousands        ; // Digit 3
  logic [31:0] ten_thousands    ; // Digit 4
  logic [31:0] hundred_thousands; // Digit 5
  logic [31:0] millions         ; // Digit 6
  logic [31:0] ten_millions     ; // Digit 7

  //-----------------------
  // Additions
  //-----------------------
  
  generate
    always_ff @(posedge clk) begin
        if (BCD_DIGIT == 2) begin // For 2 digits
            binary_out <= tens + ones ;
        end
        else if (BCD_DIGIT == 3) begin // For 3 digits
            binary_out <= hundreds + tens + ones ;
        end
        else if (BCD_DIGIT == 4) begin // For 4 digits
            binary_out <= thousands + hundreds + tens + ones ;
        end
        else if (BCD_DIGIT == 5) begin // For 5 digits
            binary_out <= ten_thousands + thousands + hundreds + tens + ones ;
        end
        else if (BCD_DIGIT == 6) begin // For 6 digits
            binary_out <= hundred_thousands + ten_thousands + thousands + hundreds + tens + ones ;
        end
        else if (BCD_DIGIT == 7) begin // For 7 digits
            binary_out <= millions + hundred_thousands + ten_thousands + thousands + hundreds + tens + ones ;
        end
        else if (BCD_DIGIT == 8) begin // For 8 digits
            binary_out <= ten_millions + millions + hundred_thousands + ten_thousands + thousands + hundreds + tens + ones ;
        end
        else begin // For 1 digit
            binary_out  <= ones;
        end

    end
  endgenerate
    
  

  //-----------------------
  // LUTs for each digit 10's weightage
  //-----------------------
  
  //For single digit 
  // no coversion required here   
  assign ones = bcd_in[3:0];

  // Digit 2
  generate
    if (BCD_DIGIT > 1) begin
      always_comb begin
        case (bcd_in[7:4])
          4'b0000 : tens = 32'd0;
          4'b0001 : tens = 32'd10;
          4'b0010 : tens = 32'd20;
          4'b0011 : tens = 32'd30;
          4'b0100 : tens = 32'd40;
          4'b0101 : tens = 32'd50;
          4'b0110 : tens = 32'd60;
          4'b0111 : tens = 32'd70;
          4'b1000 : tens = 32'd80;
          4'b1001 : tens = 32'd90;
          default : tens = 32'd0;
        endcase
      end
    end
    else begin
      assign tens = 32'd0;
    end
  endgenerate

  // Digit 3
  generate
    if (BCD_DIGIT > 2) begin
      always_comb begin
        case (bcd_in[11:8])
          4'b0000 : hundreds = 32'd0;
          4'b0001 : hundreds = 32'd100;
          4'b0010 : hundreds = 32'd200;
          4'b0011 : hundreds = 32'd300;
          4'b0100 : hundreds = 32'd400;
          4'b0101 : hundreds = 32'd500;
          4'b0110 : hundreds = 32'd600;
          4'b0111 : hundreds = 32'd700;
          4'b1000 : hundreds = 32'd800;
          4'b1001 : hundreds = 32'd900;
          default : hundreds = 32'd0;
        endcase
      end
    end
    else begin
      assign hundreds = 32'd0;
    end
  endgenerate

  // Digit 4
  generate
    if (BCD_DIGIT > 3) begin
      always_comb begin
        case (bcd_in[15:12])
          4'b0000 : thousands = 32'd0;
          4'b0001 : thousands = 32'd1000;
          4'b0010 : thousands = 32'd2000;
          4'b0011 : thousands = 32'd3000;
          4'b0100 : thousands = 32'd4000;
          4'b0101 : thousands = 32'd5000;
          4'b0110 : thousands = 32'd6000;
          4'b0111 : thousands = 32'd7000;
          4'b1000 : thousands = 32'd8000;
          4'b1001 : thousands = 32'd9000;
          default : thousands = 32'd0;
        endcase
      end
    end
    else begin
      assign thousands = 32'd0;
    end
  endgenerate
 
  // Digit 5
  generate
    if (BCD_DIGIT > 4) begin
      always_comb begin
        case (bcd_in[19:16])
          4'b0000 : ten_thousands = 32'd0;
          4'b0001 : ten_thousands = 32'd10000;
          4'b0010 : ten_thousands = 32'd20000;
          4'b0011 : ten_thousands = 32'd30000;
          4'b0100 : ten_thousands = 32'd40000;
          4'b0101 : ten_thousands = 32'd50000;
          4'b0110 : ten_thousands = 32'd60000;
          4'b0111 : ten_thousands = 32'd70000;
          4'b1000 : ten_thousands = 32'd80000;
          4'b1001 : ten_thousands = 32'd90000;
          default : ten_thousands = 32'd0;
        endcase
      end
    end
    else begin
      assign ten_thousands = 32'd0;
    end
  endgenerate

  // Digit 6
  generate
    if (BCD_DIGIT > 5) begin
      always_comb begin
        case (bcd_in[23:20])
          4'b0000 : hundred_thousands = 32'd0;
          4'b0001 : hundred_thousands = 32'd1000_00;
          4'b0010 : hundred_thousands = 32'd2000_00;
          4'b0011 : hundred_thousands = 32'd3000_00;
          4'b0100 : hundred_thousands = 32'd4000_00;
          4'b0101 : hundred_thousands = 32'd5000_00;
          4'b0110 : hundred_thousands = 32'd6000_00;
          4'b0111 : hundred_thousands = 32'd7000_00;
          4'b1000 : hundred_thousands = 32'd8000_00;
          4'b1001 : hundred_thousands = 32'd9000_00;
          default : hundred_thousands = 32'd0;
        endcase
      end
    end
    else begin
      assign hundred_thousands = 32'd0;
    end
  endgenerate

  // Digit 7
  generate
    if (BCD_DIGIT > 6) begin
      always_comb begin
        case (bcd_in[27:24])
          4'b0000 : millions = 32'd0;
          4'b0001 : millions = 32'd1000_000;
          4'b0010 : millions = 32'd2000_000;
          4'b0011 : millions = 32'd3000_000;
          4'b0100 : millions = 32'd4000_000;
          4'b0101 : millions = 32'd5000_000;
          4'b0110 : millions = 32'd6000_000;
          4'b0111 : millions = 32'd7000_000;
          4'b1000 : millions = 32'd8000_000;
          4'b1001 : millions = 32'd9000_000;
          default : millions = 32'd0;
        endcase
      end
    end
    else begin
      assign millions = 32'd0;
    end
  endgenerate

  // Digit 8
  generate
    if (BCD_DIGIT > 7) begin
      always_comb begin
        case (bcd_in[31:28])
          4'b0000 : ten_millions = 32'd0;
          4'b0001 : ten_millions = 32'd1000_0000;
          4'b0010 : ten_millions = 32'd2000_0000;
          4'b0011 : ten_millions = 32'd3000_0000;
          4'b0100 : ten_millions = 32'd4000_0000;
          4'b0101 : ten_millions = 32'd5000_0000;
          4'b0110 : ten_millions = 32'd6000_0000;
          4'b0111 : ten_millions = 32'd7000_0000;
          4'b1000 : ten_millions = 32'd8000_0000;
          4'b1001 : ten_millions = 32'd9000_0000;
          default : ten_millions = 32'd0;
        endcase
      end
    end
    else begin
      assign ten_millions = 32'd0;
    end
  endgenerate

endmodule
