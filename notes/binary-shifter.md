# Binary shifter
![../media/Pasted%20image%2020230525142026.png](../media/Pasted%20image%2020230525142026.png)

They are all in the [Pass transistor logic](notes/pass-transistor-logic.md). 
- The gate are related to the signal $\alpha$ . If $\alpha$ is one, the transistors are closed and nothing happens. So the output will be the same as the input. No shifting.
- The blue ones are transistor that connect the Ai to the Ai+1 and the A-1 to the Ai, and so on. All the gates are connected to $\beta$. If $\beta$ = 1, the transistor will be short circuit. If alpha is zero and $\beta$ is one is a shifter left
- The orange one is the same, but connecting to the gates underneath. Shift left

It is a very efficient shifter. You shouldn't put to one multiple control signals otherwise a conflicts arise.

#### See also
- [Barrel shifter](barrel-shifter.md)