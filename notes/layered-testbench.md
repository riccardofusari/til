![](../media/Screenshot%20from%202023-05-22%2009-47-06.png)


There are specific steps to determine the correctness of the DUT:
- Generate *constrained-random* stimulus (Generator)
- Apply stimulus to the DUT (Driver)
- Capture the response (Monitor)
- Check for correctness (Scoreboard)
- Measure progress against the overall verification goals (Functional Coverage)

A more in depth testbench diagram for complex systems (but here without the interface):

![](../media/Pasted%20image%2020230522105535.png)

There are three layers inside the environment and two additional blocks outside.

The first layer is the *command* layer. 
The **driver** runs single commands to the interface of the DUT' inputs. 
The DUT's output drives the **monitor** that takes signal transitions and groups them together into commands.

The second layer is the *functional* layer which feeds down into the command layer. 
The **agent** block (also called transactor) receives higher-level transactions and breaks them into individual commans or transactions.
These commands are also sent to the **scoreboard** that predicts the results of the transaction. 
The **checker** compares the commands from the monitor with those in the scoreboard.

The third layer is the *scenario* layer. The scenario is a group of tasks that the hardware is supposed to execute. The scenario layer orchestrates all the steps of a particular tasks with constrained-random values for parameters. Here there is the **generator**.

The external layer is the *test* layer.
The **test** contains the constraints to create the stimulus. 
**Functional coverage** measures the progress of all tests in fulfilling the verification plan requirements.