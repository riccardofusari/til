Considering a situation like this
![](../media/Pasted%20image%2020230529123302.png)

When you on a synopsys script put a  `create_clock ck` , you are creating a square wave emulating the clock. In a situation like the above, the variation of B is delayed from the $t_{CK->Q}$ delay of A and a certain delay related to the combinational block.

So you have two values referring to the delay.

When you do `report_timing` you have information of all the path, all the T ck to Q and then the system use this procedure to compute the SLACK.

The slack is the margin remained

$Slack = T - SUM - Setup time$

So if is positive, you have margin to reduce T, which is the period of the clock.




