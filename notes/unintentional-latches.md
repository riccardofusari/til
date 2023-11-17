A latch is a sequential logic circuit element that stores a signal value until the next clock cycle. Latches are sometimes undesirable in digital circuit design because they can result in difficult to control circuit behavior, power consumption and unintended glitches.

They can occur when a designer does not assign a  value to a signal under every possible condition. For example, if a designer creates a combinational logic circuit that assign a value to that signal under certain condition but doesn't in other, the synthesis tool will create a latch to store that signal value when it is not being explicitly set by the design.

- It is detected by synopsys after read command

- How to fix it: every variable in assigned for every way code is executed, except for flip flops

Problem code:
```verilog
always@(A or B)
begin
	if (A) C= ~B;
	else D = |B;
end
```

In this case in any branch the other variable is stored in the latch

If A is glitchy, this latch can be executed several times and led to metastability problems or hold violations

solution:

```verilog
always@(A or B)
begin	
	C = x; D = x;
	if (A) C= ~B;
	else D= |B;
```
