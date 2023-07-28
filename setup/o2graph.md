## Requisites
 - Base: [`o2scl`](./o2scl.md) 
 - Installer: [`pip`](./pip3.md) 
 - Python packages: `numpy` `h5py` `matplotlib` `requests` 
 - System: [LaTeX](latex.md) support
___

## Installation 
 1. Dependencies: `sudo apt install python3-pip python3-requests python3-numpy python3-h5py python3-matplotlib` 
 2. Additional `LaTeX` packages: `sudo apt install dvipng cm-super` 
 3. Clone [repository](https://github.com/awsteiner/o2sclpy): `git clone https://github.com/awsteiner/o2sclpy.git` 
 4. Rename for convenience: `mv o2sclpy/ o2graph/`
 5. Install: `cd o2graph/; sudo python3 setup.py install` 
___

## Setup 
To run `o2graph`, linking with `o2scl` and other libraries is required. If `o2scl` is installed with OpenMP support, then the location of the library `libgomp.1.so` needs to be specified in addition to dynamic linking.

#### I. Dynamic linking with `o2scl` 
The following Python code (see [here](https://neutronstars.utk.edu/code/o2sclpy/link_cpp.html#link2)) can be used to dynamically load `o2scl` libraries by either running as a `.py` script, or executing lines sequentially in the interactive `python3` environment. 
```
import sys
import o2sclpy

# Define linker class object
link=o2sclpy.linker()

# Set verbosity
link.verbose=1

# Link o2scl libraries
link.link_o2scl()

# To test if linking worked, obtain the o2scl version
print(link.o2scl_settings.o2scl_version())
```

#### II. Linking with OpenMP 
Define the environment variable `O2SCL_ADDL_LIBS` by adding the following line to `~/.bashrc`, and then source it:
```
# Set OpenMP library for o2sclpy
export O2SCL_ADDL_LIBS=/usr/lib/x86_64-linux-gnu/libgomp.so.1
```
`source ~/.bashrc` 
___

## Test 
Command `o2graph` should launch an interactive environment. Also try running `which o2graph` and `o2graph --version`.
___

## Usage 
See [documentation](https://neutronstars.utk.edu/code/o2sclpy/o2graph.html) and `o2graph -help` for options. 
___

## Update 
```
cd ~/o2sclpy/
git pull
sudo pip install .
```
