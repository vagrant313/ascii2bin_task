`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////////////


module ascii_to_binary_converter #( parameter DIGITS_LENGTH = 8)
    (
    input  logic                             clk,
    input  logic                             rst_n,
    
    input  logic                   [(8-1):0] ascii_char_in,
    output logic     [(DIGITS_LENGTH*4-1):0] binary_data_out,

    input  logic                             valid_in, //asssuming the valid signal will remain asserted while a signle data transmission cycle
    output logic                             busy_out
    );


    //FSM states declaration
    typedef enum logic [1:0] {
        IDLE,
        DATAACCUM, // accumulate 8-bit ascii and convert from ascii to BCD
        BCD2BINARY
    } state_t;
    
    
    //internal signals
    logic  [(DIGITS_LENGTH*4-1):0] binary_data_reg;
    logic  [(DIGITS_LENGTH*4-1):0] bcd_data_reg;
    logic                    [3:0] ascii2bcd_nibble;
    logic  [(DIGITS_LENGTH*4-1):0] ascii2bcd_data;
    
    //FSM State registers
    state_t     state_q;      //current state
    state_t     state_next;   //next state
    
    //continous state switching
    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state_q <= IDLE;
        end else begin
            state_q <= state_next;
        end
    end
    
    // FSM logic
    always_comb begin
        state_next = state_q; 
        case(state_q)
            IDLE: begin
                if(valid_in) begin
                    state_next = DATAACCUM;
                end else begin
                    state_next = IDLE;
                end
            end
            DATAACCUM: begin
                if(valid_in) begin
                    state_next = DATAACCUM;
                end 
                else begin
                    state_next = BCD2BINARY;
                end
            end
            BCD2BINARY : begin
                   // psudo state for single clk cycle
                   // bcd2binary instance will take single cycle 
                   state_next = IDLE;
            end
        endcase
        
    end   
    
   //ascii to bcd conversion
   //assuming the input character will always vary from "0-9"
   assign ascii2bcd_data = ascii_char_in - 8'd48;

   always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ascii2bcd_nibble <= '0;    
    end else begin
        ascii2bcd_nibble <= ascii2bcd_data;
    end   
   end  
    
   //accumulate data
   always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        bcd_data_reg <= '0;    
    end else if(state_q == DATAACCUM) begin
        bcd_data_reg <= { bcd_data_reg[(DIGITS_LENGTH*4-1):0], ascii2bcd_nibble};
    end 
    else begin
         bcd_data_reg <= bcd_data_reg;
    end  
   end
    
   //coversion logic with adders  
   bcd_to_bin #(.BCD_DIGIT (DIGITS_LENGTH)) inst_bcd_binary_conv(
    .clk(clk),
    .bcd_in(bcd_data_reg),
    .binary_out(binary_data_out)
   );
   
   //busy logic
   assign busy_out = (state_q == DATAACCUM) || (state_q == BCD2BINARY);
   

endmodule
