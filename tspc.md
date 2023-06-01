# True single phase clocking
It is a dynamic sequential logic. 
The general organization is made by two types of stages, one of type N and another by a P.

The circuit is always an alternation of this stages
![](Pasted%20image%2020230531091231.png)

Even if usually a circuit is made by a flip-flop -> combinational circuit -> flipflop -> combinational circuit (with a clock that goes positive and negative from flip flop to flip flop, so each block works in half clock cycle), here int the TSPC is embedded. You embed the logic of the flip flop into the circuit itself.

The chain described in the figure above is always necessary.
![](Pasted%20image%2020230531091809.png)

Every stage is composed in two part. The first is like a pre-charge phase. In both the part there is a connection to the clock. The second part is connected to the clock by an NMOS or PMOS depending on the stage. 
**Each network can embed a logic function**.


CK = '0' 
	Stage N
		The PMOS is ON, the NMOS is off. There is no flow of current through the network.
		The second network is completely off so nothing pass to the STAGE P. The second parte of the stage is maintaing a previous evaluated logic value thanks to the parasitic capacitance.
		**So first part of the stage is in precharge, the second part is in memory.**
	Stage P
		The first part can conduct current, depending of the P network. Is in the evaluation phase. The second part is like an inverter.
		**So first part is in evaluation, second part too**
CK = '1'
	Stage N
		Evaluation phase for both the part of the stage (the second part is an inverter)
	Stage P
		The first part is in pre discharge, cause the current flows and discharge. Instead the second part is in memory because there is no channel due to the NMOS off. 

We are always alternating. If the CK = '0', the first part is precharging and maintaining the value in the memory part. Then the second stage evaluate what was in memory of the stage before and put in memory.

It is like a master slave architecture. 
But we are evaluating every half clock cycle, in double data rate, due to the alternating stages.

#### Pros
- Very fast and first substage decoupled from driven load. Decoupling of the evaluation block and the driven load block. 
- just 1 clock signal (no clock negated)
- Double data rate logic function evaluation

#### Cons
- Carefully sized, is dynamic so is more difficult to manage. So you use it only when you really need it