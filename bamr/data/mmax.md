## About
Stars with initial masses above 2.0 $M_\odot$ can prevent MCMC from exploring the full posterior for $M_\mathrm{max}$, which is why the initial mass for these stars must be modified to have a pseudo-random variation around their data points.
___

## Method
There are 4 stars in NS-WD with mass above 2.0 $M_\odot$ which are listed below with their mass-data points:
| Star | Mass ($M_\odot$) |
| :----: | :----------: |
| J0348+0432 | 2.01 |
| J1600-3053 | 2.30 |
| B1516+02B | 2.10 |
| J0740+6620 | 2.14 |

Modify these points ($M$) to vary by $(M-2.0) \%$ so that the maximum value is $M$, as following:
```
acol -read nx_out -index -function "2.0+0.01*sin(N)" M_J0348 \
	-function "2.0+0.30*sin(N)" M_J1600 \
	-function "2.0+0.10*sin(N)" M_B1516 \
	-function "2.0+0.14*sin(N)" M_J0740 \
	-delete-col N -internal nx_modm
```
