![](../media/Pasted%20image%2020230529124052.png)


The internal PMOS and NMOS are connected to CLK and CLKnegated.
The external ones are related to the Data input.

- CK = '0', M4 ON, M3 ON. In that way act as an inverter of the input data.
- CK = '1', M4 OFF, M3 OFF. So they are open circuits and the input is not connected to the input but only on the parasitic capacitance.

###### Pros
- Even if there are parasitic resistances in the central mos, there is a lower leakage 
- very fast
- Good driving capability