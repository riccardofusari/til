![[Pasted image 20230525095616.png]]

Inside a microprocessor there are a lot of control and configuration signals.

The group of all those signals form a control word, which is the output of the control unit. 

Usually as an input you have the instruction coming from the instruction register and there is an hardware architecture that output the control word

The most common architecture are
1. FSM
2. Hardwired
3. Micro-programmed, which has a microprogramcounter that is incremented. For example the instruction coming is an ADD, so into the microprogrammed memory there are all the instruction of the add and the micro program counter it's incremented each time until the instruction is finished.