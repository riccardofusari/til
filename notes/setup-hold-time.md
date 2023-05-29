Considering the [Master-slave flip flop](notes/flipflop.md), problems arise when the data change when the master is shutting down the transmission gate and passing into memory phase. In this case, the output is undefined. 

The clock is not a real straight square wave. The derivative is not infinite.
Add to that a delay of the data coming. Add to that the delay of the master to change QM. If the the change of the Data is too late, too near the change of the clock, the data is undefined.

setup-time: The input data needs to stay stable for a certain time before the clock variation.

Usually the set-up time is given by a point before the transition of the clock up to the 50% of the transition.

The hold time is given by the 50% transition to a certain point after the transition.

This values are defined through simulation and characterizations, by looking at the output. If the output has a delay that doesn't corresponds to the one computed before, it is a violation.

Usually, the clock signal is driving a lot of flip flop, the signal can be very slow with a low slew rate, increasing the setup/hold time.
So generally, the external signal is conditioned with some inverters and the internal clock is delayed but more precise.
![](../media/Pasted%20image%2020230529120505.png)

Usually the time called Clk to Q is
$t_{CK->Q} = t_{50\%Q} - t_{50\%CK}$ 

So, due to the fact that the register are so frequent and so important in any complex digital circuit, it is very important that
1. The setup and hold time are very well characterized
2. The internal clock used from the flip flop is decoupled from the other circuitry


###### See also
- [flipflop](notes/flipflop.md)