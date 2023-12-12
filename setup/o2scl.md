## Requisites
- [GitHub](./github.md)


## Installation 
See instructions in [o2scl/docker](https://github.com/awsteiner/o2scl/tree/dev/docker) and always check for any recent changes. The following method is verified and tested.

### Dependecies:

```
# Update APT 
sudo apt update

# Compiler/utilities 
sudo apt install g++ make autoconf automake cmake libtool git curl

# Library dependencies
sudo apt install libgsl-dev libhdf5-dev libncurses-dev libreadline-dev libboost-all-dev libeigen3-dev libopenblas-dev liblapack-dev libarpack2-dev libsuperlu-dev libarmadillo-dev libfftw3-dev

# Python extensions
sudo apt install python3 python3-pip python3-requests python3-numpy python3-h5py python3-scipy python3-sklearn python3-matplotlib python3-pillow python3-yt python3-pytest

# LaTeX for o2sclpy
sudo apt install texlive texlive-latex-extra dvipng cm-super libcairo2-dev
```

### Install [`o2scl-dev`](https://github.com/awsteiner/o2scl/tree/dev)

```
# Go to $HOME
cd ~/

# Clone repository
git clone git@github.com:awsteiner/o2scl.git

# Go to directory 
cd ~/o2scl/

# Switch to branch 'dev'
git checkout dev

# Pull from branch 
git pull

# Make config files 
autoreconf –i

# List configurable options 
./configure --help

# Configure options
sudo LDFLAGS="-larmadillo -llapack -lblas" CXXFLAGS="-O3 -DO2SCL_UBUNTU_HDF5 -DO2SCL_HDF5_PRE_1_12 -DO2SCL_REGEX -DO2SCL_HDF5_COMP -I/usr/include -I/usr/lib/python3/dist-packages/numpy/core/include/" ./configure --enable-eigen --enable-armadillo --enable-openmp --enable-fftw --enable-python

# Create empty documentations
sudo make blank-doc

# Build using optional <n> cores:
sudo make -j <n>

# Install in /usr/local/lib/ by default 
sudo make install
```

> **Note**: Limit $n \le 3$ for 16GB RAM and $n \le 6$ for 32GB.

### Install [`o2sclpy-dev`](https://github.com/awsteiner/o2sclpy/tree/dev)

```
# Go to $HOME 
cd ~/

# Clone repository 
git clone git@github.com:awsteiner/o2sclpy.git

# Rename and go to directory 
mv o2sclpy/ o2graph/
cd ~/o2graph

# Install in /usr/local/lib/python3.XX/dist-packages/` by default 
sudo python3 setup.py install
```


## Setup
In order for the `acol` CLI to find the location of the `o2scl` library, for `o2sclpy` to dynamically load the `o2scl` library, and for `o2graph` to have OpenMP support, follow the steps below.

### Configure `acol`:

For the `acol` CLI, use `$LD_LIBRARY_PATH` to link `o2scl` library:

```
 # Set location of o2scl library for acol
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib`

# Reload bash terminal
source ~/.bashrc
```

### Link `o2sclpy` with `o2scl`:
In order for `o2graph` to recognize `acol` commands, linking with `o2scl`, and optionally other libraries, is required.

```
# Go to directory
cd ~/o2graph/o2sclpy

# Link with o2scl
sudo python3 link_o2scl.py
```

### Link `o2graph` with OpenMP:
If `o2scl` is installed with OpenMP support, then the location of the OpenMP library `libgomp.1.so` needs to be specified in addition to the dynamic linking described above:

```
# Set OpenMP library for o2graph
export O2SCL_ADDL_LIBS=/usr/lib/x86_64-linux-gnu/libgomp.so.1

# Reload bash terminal
source ~/.bashrc
``` 


## Test (optional)

```
# Check o2scl configuration/version
acol -v

# Check o2graph version
o2graph -v

# Test installation with <n> cores (optional)
sudo make o2scl-test -j <n>
```


## Update 

```
# Pull from branch
git pull

# Update o2scl
sudo make install -j <n>

# Update o2sclpy
sudo python3 setup.py install
```


## Usage
See [documentation](https://neutronstars.utk.edu/code/o2scl/html/index.html) and list of commands by doing:
```
# For file operations
acol -help 

# For plotting
o2graph -help
```