## About 
Explanations of all column names in `bamr` output table stored in a `hdf5` file. The symbols used here are:
 - Pressure: $P$ 
 - Energy density: $\epsilon$ 
 - Gravitational mass: $M$ 
 - Radius: $R$ 
 - Baryon number density: $n_b$ 
___

## Parameters
 - EOS: `a`, `alpha`, `param_S`, `param_L`, `trans1`, `trans2` 
    - Poly: `exp1`, `exp2`, `exp3` 
    - Lines: `csq1`, `csq2`, `csq3` 
 - LIGO/GW: `M_chirp_det`, `q`, `z_cdf` 
 - Mass fraction: `mf_<star>` 
 - Distribution: `mean_<pop>`, `log10_width_<pop>`, `skewness_<pop>` 
 - True mass: `M_<star>` 
___

## EOS $P(\epsilon)$ 
Pressure $P$ as a function of energy density $\epsilon$ 
`P_0-99` 
___

## Speed of Sound $C_s^2$ 
Normalized speed of sound squared: $$\frac{c_s^2}{c^2} = \frac{dP}{d\epsilon}$$
`cs2_0-99` 
___

## EOS $P(M)$ 
Pressure $P$ as a function of gravitational mass $M$ 
`PM_0-99` 
___

## $M-R$ Curve $R(M)$ 
Radius $R$ as a function of gravitational mass $M$ 
`R_0-99` 
___

## EOS $E/A(n_b)$ 
Energy per nucleon $E/A$ as a function of baryon number density $n_b$ 
`EoA_0-99` 
___

## EOS $P(n_b)$ 
Pressure $P$ as a function of baryon number density $n_b$ 
`Pnb_0-99` 
___

## Symmetry Energy  
Energy `S` and its derivative `L` 
___

## Maxima 
 - Radius: `R_max` 
 - Mass: `M_max` 
 - Pressure: `P_max` 
 - Energy density: `e_max` 
 - Baryon number density: `nb_max` 
___

## Cross Thickness
`CT_0-99` 
___

## Baryonic Mass $m_b(M)$ 
`MB_0-99` 
___

## Binding Energy $E_\mathrm{bind}(M)$
`BE_0-99` 
___

## Moments of Inertia $I(M)$, $\bar{I}(M)$ 
Inertia `I_0-99` and scaled inertia `I_bar_0-99` 

### Tidal Deformability $\bar{\Lambda}(M)$ 
`Lambda_bar_0-99` 