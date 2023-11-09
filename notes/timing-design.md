Synchronous design is one cornerstone of modern digital design. 

Events are synchronized by a master clock using ff and latches.

The logic design strongly impacts the achievable clock frequency.

As designer, I need to understand
- How the design and the CAD tools achieve a clock frequency that satisfies **set-up** requirements
- How the CAD tools try to fix **hold** requirements and why is harder with latches


# One clock, One edge; flip flops only

For each design (at least for each module) use one clock source and only one edge of that clock. Only use edge-triggered flip-flops


## Critical Path

The clock speed is determined by the slowest feasible path between registers in the design: the critical path.

It is longer with increased logic depth ( # of gates in series ).

## Clock distribution

The goal of a clock tree is for the clock to arrive at every leaf node at the same time.
The method used are a lot:
- H tree
- balance buffer delays
- balance rc delays

The clock is rarely reaching each point at the same time due to
- Clock skew: systematic clock edge variation between sites
	Caused by delay variations introduced by process (manufacturing) variations, voltage variations and temperature variations
	It is systematic.
	It is not possible to predict in advance and the variations are random.
- Clock jitters: variation clock edge timing between clock cycles
	Caused  by noise
	Smaller than the skew.

In Synopsys design compiler skw and jitter are lumped together and called Uncertainty.


## Flip Flop based design
- Q becomes D after clock edge
- Setup time: Data can not change no later than this point before the clock edge
	If data is changing within this setup time window, the input data might be lost and not stored in the flip-flop as metastability might occur. What is metastability? When setup and hold time requirements are violated, the flip-flop state becomes unstable, and after an unpredictable duration, the state of the flip-flop can settle either way (1 or 0). This scenario is known as metastability.

- Hold time: data can not change during this time after the clock edge.
- T_clok-Q: delay on output changing from positive clock edge.


Preventing the setup time

$t_{clk} >= t_{clk-Q-max} + t_{logic_max} + t_{setup} + t_{skew}$

Timing slack is the time required to turn > into =
It is the excess amount of time that we can use into our system


Preventing the hold time

$t_{hold} + t_{skew} <= t_{clk-Q-min} + t_{logic-min}$


Setup violation can happen as a result of slow conditions (slow process, high temperature) leading to signals arriving too late in the clock period
Hold violations can happen as a result of fast conditions (fast process, low temperature ) leading to signals arriving too early in the clock period

## Latch based design

- Q follows D while clock is high

Setup time and hold time_ D can not change close to the falling ("latching") clock edge

Latches are more susceptible to hold violations

## Synthesis

The tool calculates path delays under worst-case delay conditions and determines the critical path. Optimization is done and logic is added to prevent violations

After the synthesis, the tool performs STA. 
After Place and Route, performs TA.


## Multiple clock domains and Clock Domain Crossing

In modern design there are different clock domains for different modules or for block in the same module.









