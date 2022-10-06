## Prerequisites
 - Base: [[o2scl]] 
 - Installer: [[pip3]] 
 - Python packages: `numpy`, `h5py`, `matplotlib`, `requests` 
 - System: [[LaTeX]] support
___
## Installation 
 1. Package `requests`: part of system-python - installed
 2. Other packages: `sudo pip install numpy h5py matplotlib` 
 3. Additional `LaTeX` packages: `sudo apt install dvipng cm-super` 
 4. Clone repository: `git clone https://github.com/awsteiner/o2sclpy.git` 
 5. Install: `cd ~/o2sclpy`, `sudo pip install .` 
___
## Setup 
To run `o2graph`, linking with `o2scl` and other libraries is required. If `o2scl` is installed with OpenMP support, then the location of the library `libgomp.1.so` needs to be specified in addition to dynamic linking.

#### I. Dynamic linking with `o2scl` 
The following Python code can be used to dynamically load `o2scl` libraries by either running as a `.py` script, or executing lines sequentially in the interactive `python3` environment. 
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
Define the environment variable `O2SCL_ADDL_LIBS` by adding the following line to the `~/.bashrc` file, and then source it:
```
# Set OpenMP library for o2sclpy
export O2SCL_ADDL_LIBS=/usr/lib/x86_64-linux-gnu/libgomp.so.1
```
`source ~/.bashrc` 
___
## Test 
Command `o2graph` should launch an interactive environment. Also try running `which o2graph` and `o2graph --version`.