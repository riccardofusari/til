Every transition into a circuit due to some stimulus applied to it has a dynamic power  consuption.

This switching activity is defined by two main parameters:
1. Static probability, which is the probability of the signal to be 1
2. Toggle rate, transition per unit of time
The static probability is used for the computation of the leakage power, and so the static power. In particular it is used for state probability computation which are the weights of the average computation of the power in each state of each cell.

The static power of a circuit is the sum of the leakage power of every cell. This is specified in the technology library.

Two possible models:
1. Single value -> cell_leakage_power field in the liberty file.
	Ex. cell_leakage_power : 5.57076e-08;
	(leakage power units are specified in the header of the library. In the case of CORE65LPSVT_nom_1.2_25C, it is mW.)
2. State-dependent values -> one leakage power consumption value for each state of the cell. Specified in the library using the `when` condition
