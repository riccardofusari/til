SystemVerilog introduces several 2-state data types to improve simulator performance and reduce memory usage.

###### Unsigned by default
- `bit b`           2-state, single-bit unsigned
- `bit [31:0]`  2-state, 32-bit unsigned 
- `time t`          4-state, 64-bit unsigned integer

###### Signed by default
- `byte b8`       2-state, 8-bit 
- `shortint`     2-state,  16-bit
- `int`               2-state, 32-bit
- `longint`       2-state, 64-bit
- `integer`       4-state, 32-bit
- `real`             2-state, double precision floating point

Be careful connecting 2-state variables to the design under test, especially its outputs. If the hardware tries to drive an X or Z, these values are converted to a 2-state value, and your testbench code may never know. Don’t try to remember if they are converted to 0 or 1; instead, always check for propagation of unknown values. Use the $isunknown() operator that returns 1 if any bit of the expression is X or Z.

```systemverilog
if ($isunknown(iport) == 1)
	$display("@%0t: 4-state value detected on iport %b", $time, iport);
```
