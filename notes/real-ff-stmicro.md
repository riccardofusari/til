This is a real flip flop architecture from ST microelectronics
![](media/Pasted%20image%2020230529124835.png)

As a real [Master-slave](notes/flipflop.md), the master is composed with two opposed transistor logic. The transmission gate is substituted with a c2mos.

The slave has the memory phase with the same clock of the evaluation phase of the master.  One of the two transistor in the first part of the slave has a transmission gate.

The big yellow inverter on the left is added for isolate the feedback network from the external load. In that way changes of the load influence less the internal node. Also, for driving big loads.

![](media/Pasted%20image%2020230529130035.png)

Indeed, in the library there will be different flip flops for different load size. The first is size fixed so in that way the circuit sees always the same. 