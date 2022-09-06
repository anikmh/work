#! /usr/bin/bash

read -p 'Enter filename: [or path/to/file] > ' filename
read -p 'Sampling type: (1) Metropolis-Hastings (2) Affine Invariant > ' samplingtype
if [ $samplingtype -eq 2 ]
then 
    selectrows="-select-rows"
    condition="mult>0.5"
fi
read -p 'Parameter group: (1) EOS (2) LIGO (3) Population (4) Other > ' pargroup
if [ $pargroup -eq 3 ]
then 
    read -p 'Parameter type: (1) Distribution (2) True Mass > ' partype
    if [ $partype -eq 2 ]
    then 
        read -p 'Population type: (1) DNS (2) NSWD (3) HMXB (4) LMXB > ' poptype
    fi
fi
read -p 'Plot type: (1) Trace (2) Histogram (3) Likelihood > ' plottype 
if [ $plottype -eq 2 ]
then 
    read -p 'Enter bin size: ' binsize
fi

if [ $pargroup -eq 1 ]
then 
    if [ $plottype -eq 1 ]
    then 
        echo -e 'Making trace plots of EOS parameters...'
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle a -xtitle steps -plot1 a -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle alpha -xtitle steps -plot1 alpha -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle param_S -xtitle steps -plot1 param_S -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle param_L -xtitle steps -plot1 param_L -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle exp1 -xtitle steps -plot1 exp1 -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle trans1 -xtitle steps -plot1 trans1 -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle exp2 -xtitle steps -plot1 exp2 -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle trans2 -xtitle steps -plot1 trans2 -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle exp3 -xtitle steps -plot1 exp3 -show &
    elif [ $plottype -eq 2 ]
    then 
        echo -e 'Making histogram plots of EOS parameters...'
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle a -ytitle frequency -to-hist a $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle alpha -ytitle frequency -to-hist alpha $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle param_S -ytitle frequency -to-hist param_S $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle param_L -ytitle frequency -to-hist param_L $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle exp1 -ytitle frequency -to-hist exp1 $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle trans1 -ytitle frequency -to-hist trans1 $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle exp2 -ytitle frequency -to-hist exp2 $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle trans2 -ytitle frequency -to-hist trans2 $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle exp3 -ytitle frequency -to-hist exp3 $binsz -plot -show &
    elif [ $plottype -eq 3 ]
    then 
        echo -e 'Making likelihood plots of EOS parameters...'
        o2graph -read $filename markov_chain_0 -function a x -xtitle a -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function alpha x -xtitle alpha -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function param_S x -xtitle param_S -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function param_L x -xtitle param_L -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function exp1 x -xtitle exp1 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function trans1 x -xtitle trans1 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function exp2 x -xtitle exp2 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function trans2 x -xtitle trans2 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function exp3 x -xtitle exp3 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
    else 
        echo -e 'Invalid choice (exit).'
    fi 
    echo 'Done.'


elif [ $pargroup -eq 2 ] 
then 
    if [ $plottype -eq 1 ]
    then 
        echo -e 'Making trace plots of LIGO parameters...'
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_chirp_det -xtitle steps -plot1 M_chirp_det -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle q -xtitle steps -plot1 q -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle z_cdf -xtitle steps -plot1 z_cdf -show &
    elif [ $plottype -eq 2 ]
    then 
        echo -e 'Making histogram plots of LIGO parameters...'
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_chirp_det -ytitle frequency -to-hist M_chirp_det $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle q -ytitle frequency -to-hist q $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle z_cdf -ytitle frequency -to-hist z_cdf $binsz -plot -show &
    elif [ $plottype -eq 3 ]
    then 
        echo -e 'Making likelihood plots of LIGO parameters...'
        o2graph -read $filename markov_chain_0 -function M_chirp_det x -xtitle M_chirp_det -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function q x -xtitle q -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function z_cdf x -xtitle z_cdf -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show
    else 
        echo -e 'Invalid choice (exit).'
    fi 
    echo 'Done.'


elif [ $pargroup -eq 3 ] && [ $partype -eq 1 ]
then 
    if [ $plottype -eq 1 ]
    then 
        echo -e 'Making trace plots of distribution parameters...'
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle mean_NS -xtitle steps -plot1 mean_NS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle log10_width_NS -xtitle steps -plot1 log10_width_NS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle skewness_NS -xtitle steps -plot1 skewness_NS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle mean_WD -xtitle steps -plot1 mean_WD -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle log10_width_WD -xtitle steps -plot1 log10_width_WD -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle skewness_WD -xtitle steps -plot1 skewness_WD -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle mean_HMS -xtitle steps -plot1 mean_HMS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle log10_width_HMS -xtitle steps -plot1 log10_width_HMS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle skewness_HMS -xtitle steps -plot1 skewness_HMS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle mean_LMS -xtitle steps -plot1 mean_LMS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle log10_width_LMS -xtitle steps -plot1 log10_width_LMS -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle skewness_LMS -xtitle steps -plot1 skewness_LMS -show &
    elif [ $plottype -eq 2 ]
    then 
        echo -e 'Making histogram plots of distribution parameters...'
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle mean_NS -ytitle frequency -to-hist mean_NS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle log10_width_NS -ytitle frequency -to-hist log10_width_NS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle skewness_NS -ytitle frequency -to-hist skewness_NS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle mean_WD -ytitle frequency -to-hist mean_WD $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle log10_width_WD -ytitle frequency -to-hist log10_width_WD $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle skewness_WD -ytitle frequency -to-hist skewness_WD $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle mean_HMS -ytitle frequency -to-hist mean_HMS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle log10_width_HMS -ytitle frequency -to-hist log10_width_HMS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle skewness_HMS -ytitle frequency -to-hist skewness_HMS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle mean_LMS -ytitle frequency -to-hist mean_LMS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle log10_width_LMS -ytitle frequency -to-hist log10_width_LMS $binsz -plot -show &
        o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle skewness_LMS -ytitle frequency -to-hist skewness_LMS $binsz -plot -show &
    elif [ $plottype -eq 3 ]
    then 
        echo -e 'Making likelihood plots of distribution parameters...'
        o2graph -read $filename markov_chain_0 -function mean_NS x -xtitle mean_NS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function log10_width_NS x -xtitle log10_width_NS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function skewness_NS x -xtitle skewness_NS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function mean_WD x -xtitle mean_WD -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function log10_width_WD x -xtitle log10_width_WD -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function skewness_WD x -xtitle skewness_WD -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function mean_HMS x -xtitle mean_HMS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function log10_width_HMS x -xtitle log10_width_HMS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function skewness_HMS x -xtitle skewness_HMS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function mean_LMS x -xtitle mean_LMS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function log10_width_LMS x -xtitle log10_width_LMS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        o2graph -read $filename markov_chain_0 -function skewness_LMS x -xtitle skewness_LMS -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
    else 
        echo -e 'Invalid choice (exit).'
    fi 
    echo 'Done.'


elif [ $pargroup -eq 3 ] && [ $partype -eq 2 ]
then 
    if [ $plottype -eq 1 ]
    then 
        if [ $poptype -eq 1 ]
        then 
            echo -e 'Making trace plots of DNS true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0453p -xtitle steps -plot1 M_J0453p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0453c -xtitle steps -plot1 M_J0453c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1906p -xtitle steps -plot1 M_J1906p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1906c -xtitle steps -plot1 M_J1906c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1534p -xtitle steps -plot1 M_B1534p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1534c -xtitle steps -plot1 M_B1534c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1913p -xtitle steps -plot1 M_B1913p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1913c -xtitle steps -plot1 M_B1913c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B2127p -xtitle steps -plot1 M_B2127p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B2127c -xtitle steps -plot1 M_B2127c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0737A -xtitle steps -plot1 M_J0737A -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0737B -xtitle steps -plot1 M_J0737B -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1756p -xtitle steps -plot1 M_J1756p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1756c -xtitle steps -plot1 M_J1756c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1807p -xtitle steps -plot1 M_J1807p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1807c -xtitle steps -plot1 M_J1807c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1518p -xtitle steps -plot1 M_J1518p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1518c -xtitle steps -plot1 M_J1518c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1811p -xtitle steps -plot1 M_J1811p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1811c -xtitle steps -plot1 M_J1811c -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1829p -xtitle steps -plot1 M_J1829p -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1829c -xtitle steps -plot1 M_J1829c -show &
        elif [ $poptype -eq 2 ]
        then 
            echo -e 'Making trace plots of NSWD true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J2045 -xtitle steps -plot1 M_J2045 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J2053 -xtitle steps -plot1 M_J2053 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1713 -xtitle steps -plot1 M_J1713 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1855 -xtitle steps -plot1 M_B1855 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0751 -xtitle steps -plot1 M_J0751 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1141 -xtitle steps -plot1 M_J1141 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1738 -xtitle steps -plot1 M_J1738 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1614 -xtitle steps -plot1 M_J1614 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0348 -xtitle steps -plot1 M_J0348 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J2222 -xtitle steps -plot1 M_J2222 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J2234 -xtitle steps -plot1 M_J2234 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1949 -xtitle steps -plot1 M_J1949 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1012 -xtitle steps -plot1 M_J1012 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0437 -xtitle steps -plot1 M_J0437 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1909 -xtitle steps -plot1 M_J1909 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1802 -xtitle steps -plot1 M_J1802 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1911 -xtitle steps -plot1 M_J1911 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J2043 -xtitle steps -plot1 M_J2043 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0337 -xtitle steps -plot1 M_J0337 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1946 -xtitle steps -plot1 M_J1946 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1918 -xtitle steps -plot1 M_J1918 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1600 -xtitle steps -plot1 M_J1600 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0621 -xtitle steps -plot1 M_J0621 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B2303 -xtitle steps -plot1 M_B2303 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0024 -xtitle steps -plot1 M_J0024 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0514 -xtitle steps -plot1 M_J0514 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1516 -xtitle steps -plot1 M_B1516 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1748I -xtitle steps -plot1 M_J1748I -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J1748J -xtitle steps -plot1 M_J1748J -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1802 -xtitle steps -plot1 M_B1802 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_B1911 -xtitle steps -plot1 M_B1911 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J0740 -xtitle steps -plot1 M_J0740 -show &
        elif [ $poptype -eq 3 ]
        then 
            echo -e 'Making trace plots of HMXB true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_4U1700 -xtitle steps -plot1 M_4U1700 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_SMCX1 -xtitle steps -plot1 M_SMCX1 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_CenX3 -xtitle steps -plot1 M_CenX3 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_OAO1657 -xtitle steps -plot1 M_OAO1657 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_J013236 -xtitle steps -plot1 M_J013236 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_VelaX1 -xtitle steps -plot1 M_VelaX1 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_4U1538 -xtitle steps -plot1 M_4U1538 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_LMCX4 -xtitle steps -plot1 M_LMCX4 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_EXO1722 -xtitle steps -plot1 M_EXO1722 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_SAXJ1802 -xtitle steps -plot1 M_SAXJ1802 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_XTEJ1855 -xtitle steps -plot1 M_XTEJ1855 -show &
        elif [ $poptype -eq 4 ]
        then 
            echo -e 'Making trace plots of LMXB true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_CygX2 -xtitle steps -plot1 M_CygX2 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_XTEJ2123 -xtitle steps -plot1 M_XTEJ2123 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_4U1822 -xtitle steps -plot1 M_4U1822 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_HerX1 -xtitle steps -plot1 M_HerX1 -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -ytitle M_2S0921 -xtitle steps -plot1 M_2S0921 -show &
        else 
            echo -e 'Invalid choice (exit).'
        fi 
        echo 'Done.'
    
    elif [ $plottype -eq 2 ]
    then 
        if [ $poptype -eq 1 ]
        then 
            echo -e 'Making histogram plots of DNS true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0453p -ytitle frequency -to-hist M_J0453p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0453c -ytitle frequency -to-hist M_J0453c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1906p -ytitle frequency -to-hist M_J1906p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1906c -ytitle frequency -to-hist M_J1906c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1534p -ytitle frequency -to-hist M_B1534p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1534c -ytitle frequency -to-hist M_B1534c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1913p -ytitle frequency -to-hist M_B1913p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1913c -ytitle frequency -to-hist M_B1913c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B2127p -ytitle frequency -to-hist M_B2127p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B2127c -ytitle frequency -to-hist M_B2127c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0737A -ytitle frequency -to-hist M_J0737A $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0737B -ytitle frequency -to-hist M_J0737B $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1756p -ytitle frequency -to-hist M_J1756p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1756c -ytitle frequency -to-hist M_J1756c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1807p -ytitle frequency -to-hist M_J1807p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1807c -ytitle frequency -to-hist M_J1807c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1518p -ytitle frequency -to-hist M_J1518p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1518c -ytitle frequency -to-hist M_J1518c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1811p -ytitle frequency -to-hist M_J1811p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1811c -ytitle frequency -to-hist M_J1811c $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1829p -ytitle frequency -to-hist M_J1829p $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1829c -ytitle frequency -to-hist M_J1829c $binsz -plot -show &
        elif [ $poptype -eq 2 ]
        then 
            echo -e 'Making histogram plots of NSWD true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J2045 -ytitle frequency -to-hist M_J2045 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J2053 -ytitle frequency -to-hist M_J2053 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1713 -ytitle frequency -to-hist M_J1713 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1855 -ytitle frequency -to-hist M_B1855 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0751 -ytitle frequency -to-hist M_J0751 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1141 -ytitle frequency -to-hist M_J1141 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1738 -ytitle frequency -to-hist M_J1738 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1614 -ytitle frequency -to-hist M_J1614 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0348 -ytitle frequency -to-hist M_J0348 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J2222 -ytitle frequency -to-hist M_J2222 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J2234 -ytitle frequency -to-hist M_J2234 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1949 -ytitle frequency -to-hist M_J1949 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1012 -ytitle frequency -to-hist M_J1012 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0437 -ytitle frequency -to-hist M_J0437 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1909 -ytitle frequency -to-hist M_J1909 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1802 -ytitle frequency -to-hist M_J1802 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1911 -ytitle frequency -to-hist M_J1911 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J2043 -ytitle frequency -to-hist M_J2043 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0337 -ytitle frequency -to-hist M_J0337 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1946 -ytitle frequency -to-hist M_J1946 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1918 -ytitle frequency -to-hist M_J1918 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1600 -ytitle frequency -to-hist M_J1600 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0621 -ytitle frequency -to-hist M_J0621 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B2303 -ytitle frequency -to-hist M_B2303 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0024 -ytitle frequency -to-hist M_J0024 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0514 -ytitle frequency -to-hist M_J0514 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1516 -ytitle frequency -to-hist M_B1516 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1748I -ytitle frequency -to-hist M_J1748I $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J1748J -ytitle frequency -to-hist M_J1748J $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1802 -ytitle frequency -to-hist M_B1802 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_B1911 -ytitle frequency -to-hist M_B1911 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J0740 -ytitle frequency -to-hist M_J0740 $binsz -plot -show &
        elif [ $poptype -eq 3 ]
        then 
            echo -e 'Making histogram plots of HMXB true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_4U1700 -ytitle frequency -to-hist M_4U1700 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_SMCX1 -ytitle frequency -to-hist M_SMCX1 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_CenX3 -ytitle frequency -to-hist M_CenX3 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_OAO1657 -ytitle frequency -to-hist M_OAO1657 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_J013236 -ytitle frequency -to-hist M_J013236 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_VelaX1 -ytitle frequency -to-hist M_VelaX1 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_4U1538 -ytitle frequency -to-hist M_4U1538 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_LMCX4 -ytitle frequency -to-hist M_LMCX4 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_EXO1722 -ytitle frequency -to-hist M_EXO1722 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_SAXJ1802 -ytitle frequency -to-hist M_SAXJ1802 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_XTEJ1855 -ytitle frequency -to-hist M_XTEJ1855 $binsz -plot -show &
        elif [ $poptype -eq 4 ]
        then 
            echo -e 'Making histogram plots of LMXB true-mass parameters...'
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_CygX2 -ytitle frequency -to-hist M_CygX2 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_XTEJ2123 -ytitle frequency -to-hist M_XTEJ2123 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_4U1822 -ytitle frequency -to-hist M_4U1822 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_HerX1 -ytitle frequency -to-hist M_HerX1 $binsz -plot -show &
            o2graph -read $filename markov_chain_0 $selectrows $condition -xtitle M_2S0921 -ytitle frequency -to-hist M_2S0921 $binsz -plot -show &
        else 
            echo -e 'Invalid choice (exit).'
        fi 
        echo 'Done.'


    elif [ $plottype -eq 3 ]
    then 
        if [ $poptype -eq 1 ]
        then 
            echo -e 'Making likelihood plots of DNS true-mass parameters...'
            o2graph -read $filename markov_chain_0 -function M_J0453p x -xtitle M_J0453p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0453c x -xtitle M_J0453c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1906p x -xtitle M_J1906p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1906c x -xtitle M_J1906c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1534p x -xtitle M_B1534p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1534c x -xtitle M_B1534c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1913p x -xtitle M_B1913p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1913c x -xtitle M_B1913c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B2127p x -xtitle M_B2127p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B2127c x -xtitle M_B2127c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0737A x -xtitle M_J0737A -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0737B x -xtitle M_J0737B -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1756p x -xtitle M_J1756p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1756c x -xtitle M_J1756c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1807p x -xtitle M_J1807p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1807c x -xtitle M_J1807c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1518p x -xtitle M_J1518p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1518c x -xtitle M_J1518c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1811p x -xtitle M_J1811p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1811c x -xtitle M_J1811c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1829p x -xtitle M_J1829p -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1829c x -xtitle M_J1829c -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        elif [ $poptype -eq 2 ]
        then 
            echo -e 'Making likelihood plots of NSWD true-mass parameters...'
            o2graph -read $filename markov_chain_0 -function M_J2045 x -xtitle M_J2045 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J2053 x -xtitle M_J2053 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1713 x -xtitle M_J1713 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1855 x -xtitle M_B1855 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0751 x -xtitle M_J0751 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1141 x -xtitle M_J1141 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1738 x -xtitle M_J1738 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1614 x -xtitle M_J1614 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0348 x -xtitle M_J0348 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J2222 x -xtitle M_J2222 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J2234 x -xtitle M_J2234 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1949 x -xtitle M_J1949 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1012 x -xtitle M_J1012 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0437 x -xtitle M_J0437 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1909 x -xtitle M_J1909 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1802 x -xtitle M_J1802 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1911 x -xtitle M_J1911 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J2043 x -xtitle M_J2043 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0337 x -xtitle M_J0337 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1946 x -xtitle M_J1946 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1918 x -xtitle M_J1918 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1600 x -xtitle M_J1600 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0621 x -xtitle M_J0621 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B2303 x -xtitle M_B2303 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0024 x -xtitle M_J0024 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0514 x -xtitle M_J0514 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1516 x -xtitle M_B1516 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1748I x -xtitle M_J1748I -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J1748J x -xtitle M_J1748J -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1802 x -xtitle M_B1802 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_B1911 x -xtitle M_B1911 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J0740 x -xtitle M_J0740 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        elif [ $poptype -eq 3 ]
        then 
            echo -e 'Making likelihood plots of HMXB true-mass parameters...'
            o2graph -read $filename markov_chain_0 -function M_4U1700 x -xtitle M_4U1700 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_SMCX1 x -xtitle M_SMCX1 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_CenX3 x -xtitle M_CenX3 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_OAO1657 x -xtitle M_OAO1657 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_J013236 x -xtitle M_J013236 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_VelaX1 x -xtitle M_VelaX1 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_4U1538 x -xtitle M_4U1538 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_LMCX4 x -xtitle M_LMCX4 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_EXO1722 x -xtitle M_EXO1722 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_SAXJ1802 x -xtitle M_SAXJ1802 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_XTEJ1855 x -xtitle M_XTEJ1855 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        elif [ $poptype -eq 4 ]
        then 
            echo -e 'Making likelihood plots of LMXB true-mass parameters...'
            o2graph -read $filename markov_chain_0 -function M_CygX2 x -xtitle M_CygX2 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_XTEJ2123 x -xtitle M_XTEJ2123 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_4U1822 x -xtitle M_4U1822 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_HerX1 x -xtitle M_HerX1 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
            o2graph -read $filename markov_chain_0 -function M_2S0921 x -xtitle M_2S0921 -function log_wgt y -ytitle log_wgt -scatter x y None None marker=. -show &
        else 
            echo -e 'Invalid choice (exit).'
        fi 
        echo 'Done.'
    else 
        echo -e 'Invalid choice (exit).'
    fi 
else 
    echo -e 'Invalid choice (exit).'
fi 
