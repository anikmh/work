## About
Build a data file for best initial points to be used with 3 coupled threads, based on a single-thread data file.
___

 - First, generate a single-threaded, no_mpi data file (`nl_0_out`) with at least 300 (=`n_walk`) rows, `aff_inv`=0, and `n_walk`=1 (use `step_fac`=`max_iters`=10000). Suppose there are total $300<M<400$ rows in the data file. Then,

```
cp nl_0_out nl_0
acol -read nl_0 -index -select-rows "N<100" \
	-function 0.0 thread -function "N%100" walker \
	-internal nl0
acol -read nl_0 -index -select-rows "N>=100 && N<200" \
	-function 1.0 thread -function "N%100" walker \
	-internal nl1
acol -read nl_0 -index -select-rows "N>=200 && N<300" \
	-function 2.0 thread -function "N%100" walker \
	-internal nl2
acol -read nl_0 -index -select-rows "N>=300" \
	-function 0.0 thread -function "N%100" walker \
	-internal nl3
acol -read nl0 -cat nl1 -cat nl2 -cat nl3 -internal nl_0
```

