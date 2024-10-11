module dff_7474 (
  input d,
  input clk,
  input pre_n,
  input clr_n, 
  output reg q,
  output q_n
);

  assign q_n = ~q;

  always @(posedge clk) begin
    if (!pre_n) begin
      q <= 1'b1;
    end else if (!clr_n) begin 
      q <= 1'b0;
    end else begin
      q <= d;
    end
  end
endmodule

module shift_register_3bit (
  input clk,
  input data_in,
  input clr_n,
  output q0,
  output q1,
  output q2
);

  wire q0_n, q1_n, q2_n; 
  
  dff_7474 ff0 (
    .d(data_in),
    .clk(clk),
    .pre_n(1'b1),
    .clr_n(clr_n),
    .q(q0),
    .q_n(q0_n)
  );

  dff_7474 ff1 (
    .d(q0),        
    .clk(clk),
    .pre_n(1'b1),
    .clr_n(clr_n),
    .q(q1),
    .q_n(q1_n)
  );

  dff_7474 ff2 (
    .d(q1),        
    .clk(clk),
    .pre_n(1'b1),
    .clr_n(clr_n),
    .q(q2),
    .q_n(q2_n)
  );
endmodule

module lock_control (
  input clk,
  input data_in,
  input clr_n,
  output lock_led,
  output unlock_led,
  output q0,
  output q1,
  output q2
);

//  wire q0, q1, q2;
  wire r0, r1, r2;

  shift_register_3bit sr (
    .clk(clk),
    .data_in(data_in),
    .clr_n(clr_n),
    .q0(q0),
    .q1(q1),
    .q2(q2)
  );
  
  assign r0 = q2;
  assign r1 = q1;
  assign r2 = q0;

  or or1 (lock_led, ~r0, r1, ~r2);
  assign unlock_led = ~lock_led;
endmodule
