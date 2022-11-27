## Requisites
- Dependencies: `g++ make automake autoconf libtool libeigen3-dev libmpfr-dev libpython3-all-dev libfftw3-dev libopenmpi-dev libgsl-dev libboost-all-dev libreadline-dev libncurses-dev libhdf5-dev` 
- Optional: `libcubature-dev` 
- Repository: [GitHub](./github.md)
___
## Installation 
 1. Install dependencies and `cd ~/` 
 2. Clone [repository](https://github.com/awsteiner/o2scl): `git clone https://github.com/awsteiner/o2scl` 
 3. `cd ~/o2scl/` and make config files: `autoreconf –i` 
 4. To see list of configurable options: `./configure --help` 
 5. Configure options: `sudo CXXFLAGS="-DO2SCL_HDF5_PRE_1_12" ./configure --enable-mpfr --enable-python --enable-fftw --enable-eigen --enable-openmp` 
 6. Create empty documentation: `sudo make blank-doc` 
 7. Build using optional n-cores: `sudo make -j n` 
 8. Install in `/usr/local/lib/` by default: `sudo make install` 
___
## Setup
For `acol` CLI, use `$LD_LIBRARY_PATH` to link `o2scl` library
 - Append the following lines to `~/.bashrc`:
	```
	# Set o2scl library for acol 
	export LD_LIBRARY_PATH=/usr/local/lib
	```
 - `source ~/.bashrc` 
___
### Test installation (optional)
 - Check o2scl configuration and version: `acol -v` 
 - Test installation with n-cores (optional)
   - Automatic - test all classes recursively
     `cd ~/o2scl; sudo make o2scl-test -j n` 
   - Manual - test individual classes
     `cd ~/o2scl/src/<class>/; sudo make o2scl-test -j n` ...
___
## Update 
```
cd ~/o2scl
git pull
sudo make install -j n.
```
___
## Usage
See [documentation](https://neutronstars.utk.edu/code/o2scl/html/index.html) and `acol -help` for list of options. 