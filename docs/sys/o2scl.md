## Prerequisites
- Dependencies: `g++ make automake autoconf libtool libeigen3-dev libmpfr-dev libpython3-all-dev libfftw3-dev libcubature-dev libopenmpi-dev libgsl-dev libboost-all-dev libreadline-dev libncurses-dev libhdf5-dev` 
- [[GitHub]] setup
___
## Installation 
 - Install dependencies and `cd ~/` 
 - Clone [GitHub repository](https://github.com/awsteiner/o2scl): `git clone https://github.com/awsteiner/o2scl` 
 - `cd ~/o2scl/` and make config files: `autoreconf –i` 
 - To see list of configurable options: `./configure --help` 
 - Configure options: `sudo CXXFLAGS="-DO2SCL_HDF5_PRE_1_12" ./configure --enable-mpfr --enable-cubature --enable-python --enable-fftw --enable-eigen --enable-openmp` 
 - Create empty documentation: `make blank-doc` 
 - Build using optional n-cores: `sudo -j n make` 
 - Install in `/usr/local/lib/` by default: `sudo make install` 
___
## Setup
For `acol` CLI, use `$LD_LIBRARY_PATH` to link `o2scl` library
 - Append the following lines to `~/.bashrc`:
    \# Link o2scl for acol 
    `export LD_LIBRARY_PATH=/usr/local/lib` 
 - `source ~/.bashrc` 
___
### Test installation (optional)
 - Check o2scl configuration and version: `acol -v` 
 - Test installation with n-cores (optional)
   - Automatic - test all classes recursively
     `cd ~/o2scl; sudo make -j n o2scl-test` 
   - Manual - test individual classes
     `cd ~/o2scl/src/<class>/; sudo make -j n o2scl-test` ...
___
## Update 
 - `cd ~/o2scl && git pull` 
 - `sudo make -j n install .` 
___
## Usage
See [o2scl documentation](https://neutronstars.utk.edu/code/o2scl/html/index.html) and `acol -help` for list of options. 
