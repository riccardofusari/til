Functional coverage is a measure of what functionalities/features of the design have been exercised by the tests. This can be useful in constrained random verification (CRV) to know what features have been covered by a set of tests in a regression.


The good part is that there are options in a simulator to dump out such coverage details into a file so that it can be reviewed after the simulation has finished. Moreover, you can merge all such coverage files from different tests into a single database and review them as a whole. If test A covered feature X and test B covered feature Y, the merged database will show that you have covered both X and Y.


the variables are mentioned as a `coverpoint`. All the `coverpoint` are put together into `covergroup`. It is also possible to have multiple covergroups to sample the same variables with different set of `bins`. The `bins` are hit/covered when the variable reaches the corresponding values

```systemverilog
covergroup rca_cg;

/* Carry input coverpoint */
carry_in: coverpoint locRca_if.rca_cin {
	bins zero = {0};
	bins one = {1};
}

a_cp: coverpoint locRca_if.rca_a {
/* Corner values: first, last and last signed */
	bins corners[] = {0, (1<<DWIDTH)-1, (1<<(DWIDTH-1))-1};
	bins others = default;
}

b_cp: coverpoint locRca_if.rca_b {
/* Corner values: first, last and last signed */
	bins corners[] = {0, (1<<DWIDTH)-1, (1<<(DWIDTH-1))-1};
	bins others = default;
}

endgroup: rca_cg
```
