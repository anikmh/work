## Requisites
 - [SSH](./ssh.md)
 - [GitHub](./github.md)
 - [`o2scl+py`](./o2scl.md) 
 - [SVN](./svn.md)


## Installation 
Git repository: <https://github.com/awsteiner/bamr/tree/dev>

```
# Clone repository
git clone git@github.com:awsteiner/bamr.git

# Go to directory 
cd ~/bamr 

# Switch branch
git checkout dev

# Check current branch 
git branch -a

# Pull from branch 
git pull
```


## Setup 

### Configure makefile
Append the following lines to `~/.bashrc`, and then source it:

```
# Set makefile for bamr
export UTKNA_MAKEFILE=/home/anik/shared/Makefile.inc
export MACHINE=anikxpc

# Reload bash terminal
source ~/.bashrc
```

### Build executables
Verify that `o2scl` is installed with OpenMP support and that SVN is set up with `Makefile.inc` located in `~/shared/` directory. Then build the executable, optionally using $n$-cores for faster compilation.

```
# Single core
make bamr_nompi -j <n>

# OpenMP/MPI
make bamr -j <n>
```

> **Note**: Limit $n \le 6$ for 16 GB RAM and $n \le 12$ for 32 GB.


## Test 
```
# Check library definitions
make utkna
```
