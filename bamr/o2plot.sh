#! /usr/bin/bash

echo -e 'Enter name of parameter to plot'
read -p '[column name]: ' par
o2graph -read np_0_out markov_chain_0 -plot1 log_wgt_pop \
    -xtitle "Steps" -ytitle "log_wgt_pop" -show & \
o2graph -read np_0_out markov_chain_0 -plot1 log_wgt_NS \
    -xtitle "Steps" -ytitle "log_wgt_NS" -show & \
o2graph -read np_0_out markov_chain_0 -plot1 log_wgt_WD \
    -xtitle "Steps" -ytitle "log_wgt_WD" -show & \
o2graph -read np_0_out markov_chain_0 -plot1 log_wgt_HMS \
    -xtitle "Steps" -ytitle "log_wgt_HMS" -show & \
o2graph -read np_0_out markov_chain_0 -plot1 log_wgt_LMS \
    -xtitle "Steps" -ytitle "log_wgt_LMS" -show & \
o2graph -read np_0_out markov_chain_0 -function mean_NS x -xtitle \
    "Mean ($ \mu$)" -function log_wgt_NS y -ytitle \
    "$ \log{\mathcal{L}}$" -plot x y -ttext 0.5 0.95 NS-NS -show &
