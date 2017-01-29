module debounce(

  input clk,
  input A,
  output logic triggered

);

logic A0;
logic A1;
logic [15:0] count;

//sync to the clock
always @(posedge clk)
  begin
    A0 <= A;
  end

always @(posedge clk)
  begin
    A1 <= A0;
  end
// end sync

// now that inputs are syncd to the clock
// clear counter if we have decided that the input is true
// otherwise pass any input through that makes 16 consecutive passes as being true.
// we will take 16 as being an affirmative press/turn
always @(posedge clk)
  if (triggered == A0)
    count <= 0;
  else
    begin
      count++;
      if (count == 16'hFFFF)
        triggered <= ~triggered;
    end
endmodule

