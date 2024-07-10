## Requisites
- [GitHub](./github.md)


## Installation 
See instructions in [o2scl/docker](https://github.com/awsteiner/o2scl/tree/dev/docker) and always check for any recent changes. The following method is verified and tested.

### Dependecies:

```
# Update APT 
sudo apt update

# Compiler/utilities 
sudo apt install g++ make autoconf automake cmake libtool git curl imagemagick

# Library dependencies
sudo apt install libgsl-dev libreadline-dev libhdf5-dev libboost-all-dev libeigen3-dev libopenblas-dev liblapack-dev libarpack2-dev libsuperlu-dev libfftw3-dev libcairo2-dev libquadmath0 libz-dev libsz2 zlib1g-dev

# Python extensions
sudo apt install python3 python3-numpy

# LaTeX for o2sclpy
sudo apt install texlive texlive-full texlive-publishers dvipng cm-super
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
sudo CXXFLAGS="-O3 -DO2SCL_UBUNTU_HDF5 -DO2SCL_HDF5_PRE_1_12 -DO2SCL_HDF5_COMP -I/usr/include -I/usr/lib/python3/dist-packages/numpy/core/include/" ./configure --enable-eigen --enable-openmp --enable-fftw --enable-python --disable-static

# Create empty documentations
sudo make blank-doc

# Build using optional <n> cores:
sudo make -j <n>

# Install in /usr/local/lib/ by default 
sudo make install
```

> **Note**: Limit $n \le 3$ for 16GB RAM and $n \le 6$ for 32GB.

### Install [`o2sclpy`](https://github.com/awsteiner/o2sclpy/tree/dev)
> **Note**: Due to the deprecation of the `setup.py` script, `o2sclpy` can no longer be installed globally (in `/usr/local/`) without `sudo pip`, which is highly discouraged.

It is recommended to install `o2sclpy` in a virtual environment from the PyPI repository (using `pip`). Follow the instructions in the [conda](./conda.md) documentation to install `o2sclpy` in the `conda` environment. Then do the steps outlined in the next section to link `o2sclpy` with the `o2scl` and OpenMP libraries.


## Setup
In order for the `acol` CLI to find the location of the `o2scl` library, for `o2sclpy` to dynamically load the `o2scl` library, and for `o2graph` to have OpenMP support, follow the steps below.

### Configure `acol`:

For the `acol` CLI, use `$LD_LIBRARY_PATH` to link `o2scl` library:

```
 # Set location of o2scl library for acol
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Reload bash terminal
source ~/.bashrc
```

### Linking `o2sclpy`:
Since `o2sclpy` is installed in a virtual environment, `o2scl` needs to know its location. Also, if `o2scl` is installed with OpenMP support, then the location of the OpenMP library must be specified for `o2graph`. These can be done by defining the following environment variables in `~/.bashrc`.

```
# Set variables for o2sclpy
export O2SCL_PYTHON_EXT=/home/anik/mconda/envs/tfg/lib/python3.12/site-packages
export O2SCL_ADDL_LIBS=/usr/lib/x86_64-linux-gnu/libgomp.so.1

# Reload bash terminal
source ~/.bashrc
``` 

In addition, for `o2graph` to recognize `acol` commands, `o2sclpy` must be dynamically linked with `o2scl`:

```
# Go to o2sclpy directory
cd ~/mconda/envs/tfg/lib/python3.12/site-packages/o2sclpy

# Activate conda environment for python3
conda activate tfg

# Install the dependent package for linking
conda install yt

# Link with o2scl
python3 link_o2scl.py
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
# Switch branch if necessary (optional)
git checkout <branch>

# Pull from branch
git pull

# Update o2scl
sudo make install -j <n>

# Update o2sclpy
conda activate tfg
pip install o2sclpy --upgrade
```


## Usage
See [documentation](https://neutronstars.utk.edu/code/o2scl/html/index.html) and list of commands by doing:
```
# For file operations
acol -help 

# For plotting
o2graph -help
```