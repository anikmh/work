## About
Build a data file for best initial points to be used with coupled `n_threads`, based on a single-thread data file.
___

## Method
 1. Generate a `no_mpi` data file with >=300 non-zero rows (`n_thread`=1, `n_walk`=300, `aff_inv`=0, `step_fac`=`max_iters`=10000). 
 2. Set `n_walk`=300/`n_thread` 

Then do:
```
acol -read nx_0_out markov_chain_0 -index \
	-function "N%n_walk" walker \
	-function "(N/n_walk)%n_thread" thread \
	-delete-col N -internal nxnt0
```
