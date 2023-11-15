## Requisites
 - Base: [`o2scl`](./o2scl.md) with OpenMP support
 - Building: [`Makefile.inc`](./svn.md) (makefile)
 - Plotting: [`o2graph`](./o2graph.md) (from `o2sclpy`)


## Installation 
 - Clone [repository](https://github.com/awsteiner/bamr) (SSH): 
   `git clone git@github.com:awsteiner/bamr.git` 
 - `cd ~/bamr` and switch to current branch `pop`:
   `git checkout pop` 
 - Check if switched to branch: `git branch -a` 
 - Pull from branch: `git pull` 


## Setup 
Define environment variables `MACHINE` and `UTKNA_MAKEFILE` by appending the following lines to `~/.bashrc`:
```
# Set libraries for bamr
export UTKNA_MAKEFILE=/home/anik/shared/Makefile.inc
export MACHINE=anikxpc
```

Configure `.git/config` to default to branch `pop` for `push`/`pull`:
`git config init.defaultBranch pop` (unverified)
`git config branch.pop.remote origin` 
`git config branch.pop.merge refs/heads/pop` 


## Test 
Check definitions: `make utkna`


## Build 
Compilation: `make bamr` or `make bamr_nompi` 