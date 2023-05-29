# Differential Cascode Voltage Swing Logic
There are normally two outputs one negated in respect to the other, associated to two voltage levels. They are used to drive other stages.
![](../media/Pasted%20image%2020230529093412.png)
The advantage of the differential signals is for common noise rejection.
One pmos is connected to the output of the other pmos.
The networks that follows are complementary and they function as pull down of the logic (the pmos the pull up).
The presence of the capacitance is associated to the gate of the opposite transistor and the transistor above.
![](../media/Pasted%20image%2020230529094123.png)

When the N transistor are acting as pull-down, means that they are discharging those capacitance. Instead if are acting as pull-up, they are charging them.

1. A,B are 0           -> N network disabled, Nnegated is open
2. A,B going to 1   -> The N network starts to flow current and pull-down the PM2, charging the capacitance C2. OUT is going down cause the current is discarging the capacitance C1.
3. A,B near 1         -> PM1 is Off now, so OUT = 0, OUTnegated =  1


###### Pros
- Reaction is really fast due to the positive feedback
- Reduced short circuit power (VDD-GND connection during switching)
- Increades SNR
- Generation of both output negated and positive
###### Cons
- Area, due to double network
- Leakage, due to double network

#### See also
- [Domino](domino-logic.md)
- [switch-model](switch-model.md)
- [cmos](cmos.md)