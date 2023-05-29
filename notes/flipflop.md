It is configured in a master-slave configuration with a two latches
![](../media/Pasted%20image%2020230529105806.png)

But, they have an inverse clock evaluation, one opposite of the other.
If one is negative level triggered, the other one is positive. 

So the flip flop name (positive or negative edge triggered) depends on the configuration of the latches (positive/negative LEVEL triggered).

![](../media/Pasted%20image%2020230529111820.png)

- CK = 0    -> TG1 ON, TG4 ON, TG2 OFF, TG3 OFF  -> MASTER evaluation and SLAVE memory
- CK = 1     -> TG2 ON, TG3 ON, TG1 OFF, TG4 OFF -> MASTER memory and SLAVE evaluation

So they work in an opposite phase.

So, in reality, The master sample every variation of the input data and stored into QM. Only during the positive clock edge the slave output the last sample of the master, stored in QM, with a **small delay**.

So the phenomenon seems that at the clock rising edge the value is sampled and transferred to the output. But in reality that is not true. 

The delays of the transitions depends to the delays of the transmission gate activation

Summary
1. It is not true that the flipflop is sampling at the edge. What do you see at the edge is the transfer of the data from the master to the slave
2. There is a delay. The delay depends from the activation/deactivation of the transmission gate and the inverters present in the master and the slave

This bring to the main problems of flip flop: setup time and hold time.

##### See also
- [setup-hold-time](setup-hold-time.md)