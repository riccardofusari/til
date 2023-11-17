#### Propagation and contamination delay
The **propagation delay tpd** is the maximum time from when an input changes until the output or outputs reach their final value. 

The **contamination delay** **tcd** is the minimum time from when an input changes until any output starts to change its value.
![](../media/Pasted%20image%2020231117213356.png)

#### Critical path and short path
The clock speed is determined by the longest and slowest feasible path between registers in the design: **the critical path.** It is longer with increased logic depth ( # of gates in series ).

The **short path** is the shortest, and therefore the fastest, path through the circuit.

**The propagation delay of a combinational circuit is the sum of the propagation delays through each element on the critical path. The contamination delay is the sum of the contamination delays through each element on the short path.**

#### Dynamic discipline
When the clock rises, the output (or outputs) may start to change after the clock-to-Q contamination delay, tccq, and must definitely settle to the final value within the clock-to-Q propagation delay, tpcq. These represent the fastest and slowest delays through the circuit, respectively. For the circuit to sample its input correctly, the input (or inputs) must have stabilized at least some setup time, tsetup, before the rising edge of the clock and must remain stable for at least some hold time, thold, after the rising edge of the clock. The sum of the setup and hold times is called the aperture time of the circuit, because it is the total time for which the input must remain stable.

Setup time:
$T_{clk} <= T_{prop-clk-to-q} + T_{prop-comb} + t_{setup} + t_{skew}$
The problem can be solved by increasing the clock period or by redesigning the combinational logic to have a shorter propagation delay.

Hold time:
$t_{hold} + t_{skew} <= T_{cont-clkq-to-q} + T_{cont-com-d}$
n other words, a reliable flip-flop must have a hold time shorter than
its contamination delay.Unlike setup time constraints, they cannot be fixed by adjusting the clock period. Redesigning an integrated circuit and manufacturing the corrected design takes months and millions of dollars in today’s advanced technologies, so hold time violations must be taken extremely seriously. 
An example solution can be adding buffers to slow down the short paths.