`timescale 1ns / 1ps

module combinational_lock_tb();
    reg clk;
    reg data_in, clr_n;
    wire lock_led, unlock_led, q0, q1, q2;

    lock_control UUT (
        .clk(clk),
        .data_in(data_in),
        .clr_n(clr_n),
        .unlock_led(unlock_led),
        .lock_led(lock_led),
        .q0(q0),
        .q1(q1),
        .q2(q2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end
   
    initial begin
        clr_n = 0; 
        #10;
        clr_n = 1;
    end

    initial begin
    	$dumpfile("cmblock.vcd");
    	$dumpvars(0, combinational_lock_tb);
    
        // Test sequence (000)
        @(posedge clk); data_in = 0; #10;
        @(posedge clk); data_in = 0; #10;
        @(posedge clk); data_in = 0; #10;
        @(posedge clk);
        $display("Input: 000, Q: %b%b%b, Lock: %b, Unlock: %b", q2, q1, q0, lock_led, unlock_led);
        @(posedge clk); clr_n = 0; #10;
        @(posedge clk); clr_n = 1; #10;
        
        // Test sequence (011)
        @(posedge clk); data_in = 0; #10;
        @(posedge clk); data_in = 1; #10;
        @(posedge clk); data_in = 1; #10;
        @(posedge clk);
        $display("Input: 011, Q: %b%b%b, Lock: %b, Unlock: %b", q2, q1, q0, lock_led, unlock_led);
        @(posedge clk); clr_n = 0; #10;
        @(posedge clk); clr_n = 1; #10;
        
        // Test sequence (101)
        @(posedge clk); data_in = 1; #10;
        @(posedge clk); data_in = 0; #10;
        @(posedge clk); data_in = 1; #10;
        @(posedge clk);
        $display("Input: 101, Q: %b%b%b, Lock: %b, Unlock: %b", q2, q1, q0, lock_led, unlock_led);
        @(posedge clk); clr_n = 0; #10;
        @(posedge clk); clr_n = 1; #10;
        
        // Test sequence (111)
        @(posedge clk); data_in = 1; #10;
        @(posedge clk); data_in = 1; #10;
        @(posedge clk); data_in = 1; #10;
        @(posedge clk);
        $display("Input: 111, Q: %b%b%b, Lock: %b, Unlock: %b", q2, q1, q0, lock_led, unlock_led);
        @(posedge clk); clr_n = 0; #10;
        @(posedge clk); clr_n = 1; #10;

        $finish;
    end
endmodule

