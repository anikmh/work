## Requisites
- Dependencies (see below) 
- Repository: [GitHub](./github.md)


## Installation 
See instructions in [o2scl/docker](https://github.com/awsteiner/o2scl/blob/main/docker/ubuntu_dev_full) and <span class="yellow">always check for any recent changes</span>. The following method is verified and tested.

#### Dependecies:
```
# Update APT 
sudo apt update

# Compiler/utilities 
sudo apt install g++ make autoconf automake cmake libtool

# GSL libraries
sudo apt install libgsl-dev

# HDF5/ncurses/readline: 
sudo apt install libhdf5-dev libncurses-dev libreadline-dev

# Boost/Eigen
sudo apt install libboost-all-dev libeigen3-dev

# Armadillo and dependencies
sudo apt install libopenblas-dev liblapack-dev libarpack2-dev
sudo apt install libsuperlu-dev libarmadillo-dev libfftw3-dev

# git/curl 
sudo apt install git curl

# Python extensions
sudo apt install python3 python3-pip python3-h5py

# LaTeX for o2sclpy
sudo apt install texlive dvipng cm-super
sudo apt install texlive-latex-extra

# o2sclpy dependencies: 
sudo apt install python3-numpy python3-scipy python3-matplotlib
sudo apt install python3-requests python3-pillow
sudo apt install python3-yt python3-pytest libcairo2-dev
```

#### Main
 1. Install dependencies and `cd ~/` 
 2. Clone [repository](https://github.com/awsteiner/o2scl): `git clone https://github.com/awsteiner/o2scl` 
 3. Go to directory: `cd ~/o2scl/` 
 4. Switch to `dev` branch: `git checkout dev`
 5. Pull from branch: `git pull`
 6. Make config files: `autoreconf –i` 
 7. To see list of configurable options: `./configure --help` 
 8. Configure options: 
    ```
    sudo LDFLAGS="-larmadillo -llapack -lblas -lncurses" CXXFLAGS="-O3 -DO2SCL_UBUNTU_HDF5 -DO2SCL_HDF5_PRE_1_12 -DO2SCL_REGEX -DO2SCL_HDF5_COMP -I/usr/include -I/usr/lib/python3/dist-packages/numpy/core/include/" ./configure --enable-eigen --enable-armadillo --enable-openmp --enable-fftw --enable-python
    ```
 6. Create empty documentation: `sudo make blank-doc` 
 7. Build using optional n-cores: `sudo make -j n` 
 8. Install in `/usr/local/lib/` by default: `sudo make install` 


## Setup
For `acol` CLI, use `$LD_LIBRARY_PATH` to link `o2scl` library
 - Append the following lines to `~/.bashrc`:
   `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib`
 - `source ~/.bashrc` 


### Test installation (optional)
 - Check o2scl configuration and version: `acol -v` 
 - Test installation with n-cores (optional)
   - Automatic - test all classes recursively
     `cd ~/o2scl; sudo make o2scl-test -j n` 
   - Manual - test individual classes
     `cd ~/o2scl/src/<class>/; sudo make o2scl-test -j n` ...


## Update 
```
cd ~/o2scl
git pull
sudo make install -j n
```


## Usage
See [documentation](https://neutronstars.utk.edu/code/o2scl/html/index.html) and `acol -help` for list of options. 