## Requisites
 - Base: [`o2scl`](./o2scl.md) with OpenMP
 - Building: [`Makefile.inc`](./svn.md) 
 - Plotting: [`o2graph`](./o2graph.md) 
___
## Installation 
Clone [repository](https://github.com/awsteiner/bamr) (SSH): `git clone git@github.com:awsteiner/bamr.git` 
___
## Setup 
Define environment variables `MACHINE` and `UTKNA_MAKEFILE` by appending the following lines to `~/.bashrc`:
```
# Set libraries for bamr
export UTKNA_MAKEFILE=/home/anik/shared/Makefile.inc
export MACHINE=anikxpc
```
___
## Test 
Check definitions: `cd ~/bamr` and `make utkna`
___
## Build 
Compilation: `make bamr` or `make bamr_nompi` 