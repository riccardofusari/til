# CMOS
This is maybe the most diffused logic family.
Follows an inverter
![](../media/Pasted%20image%2020230525190110.png)

The P-network is usually called pull-up (is referenced to power supply)
the N-network is usually called pull-down (is referenced to reference voltage).

The two circuit work in a complementary way and share the same input.

Usually the CMOS output is always "negated". That means that the normal configurations produce nand or not, due to the P-Network on top. Could be the other way around theoretically right, but problems would be introduced. Indeed, the P-mos is better suited with higher current, so near the power supply. On the other hand, the N-mos is better suited connected to ground.

![](../media/Pasted%20image%2020230525190153.png)
*NAND*


Of course, the described circuit introduce a delay. The delay can be subdivided into two important times definition
- the *propagation time*, defined as the delay between the time in which the input reaches 50% of its swing and the time in which the output reaches 50% of its swing;
- the *transition time*, which is related to the output only and is defined as the time between the moment in which the output reaches 10% of its swing and the moment in which the output reaches 90% of its swing
![](../media/Pasted%20image%2020230529155207.png)

#### See also
- [Transmission gates](transmission-gates.md)
- [pseudo NMOS family](pseudo-nmos-family.md)


