# Recirculating latch
The Latch and FF they are not as you learned in the bachelor, for meta stability problems.

The real implementation in integrated circuit is based on reaction and $C^2$MOS logic.

The principle behind this implementation is the following
![](media/Pasted%20image%2020230529104059.png)

Do the D input is driven by the inverter (it could be also a buffer, but usually using CMOS technology) through a transmission gate. The transmission gate allows the signal to pass only when CK = 1. Then pass through the second inverter to the output. If TG is off, the value is stored into the memory by the parasitic capacitance between the TG and the inverter. 
The problem with that is the leakage current of the TG due to non ideality, and the capacitance is really low.  Because of this it is necessary to frequently refresh the information in order to protect the value from leakage. To solve this inconvenient a recirculating latch is used.

##### The recirculating latch
![](media/Pasted%20image%2020230529104357.png)

The TG2 has an opposite connection for the CK.
- CK = '0'  -> TG1 on, TG2 off
- CK = '1'   -> TG1 off, TG2 on

if CK= '0', it is a pass-through. It is like the first circuit, called evaluation phase

Instead, if CK = '1':
![](media/Pasted%20image%2020230529104859.png)
This is the memory phase, so we are maintaining the value. In fact, the inverters are connected to VDD and GND. In this feedback they are confirming this value together. So even if there is a power dissipation, thanks to that inverters the values are maintained and rewritten.

When CK = 1, TG1 is off and if the data change, the output doesn't. Only when the clock goes to 0 again, the output is evaluated and then updated with a certain delay. This is called recirculating latch.

###### See also
- [flipflop](flipflop.md)
