## About 
Use `anaconda3`/`miniconda3` to deploy TensorFlow, a powerful machine-learning tool, with GPU support while avoiding inference with system-packages. `conda` is a smart and advanced CLI superior to `pip` that makes such deployment a breeze. 


## Requisites 
 - For TensorFlow with GPU: [Nvidia driver](./nvidia.md) 
 - (Optional) For GUI packages: `libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6` 


## Installation 
Download the latest [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installer for Linux or the one with preferred Python version 3.XX .

```
# Check SHA-256 hash of installer to verify version
sha256sum Miniconda3-latest-Linux-x86_64.sh

# Install in ~/mconda3 when prompted
bash Miniconda3-latest-Linux-x86_64.sh

# Respond 'yes' to initialize conda during installation

# Source bashrc or restart terminal
source ~/.bashrc

# Disable auto-activation of base environment
conda config --set auto_activate_base false
```


## Test 
Command `conda info` should print configuration. Also check `conda --version`.


## Setup
 
```
# Add channel conda-forge which contains most recent packages
conda config --add channels conda-forge

# (Optional) Set strict channel priority for conda-forge
conda config --set channel_priority strict

# Check list of channels
conda config --show-sources

# Install tensorflow-gpu in a conda environment
conda create -n tfg python=3.xx tensorflow-gpu

# Verify that all packages are from conda-forge

# (Optional) Check package sources in this environment
conda list --show-channel-urls

# Activate 'tfg' environment
conda activate tfg

# Install required and optional packages

# (Required) o2sclpy dependencies
conda install yt matplotlib scipy scikit-learn 

# (Required) CUDA for tensorflow-gpu
conda install cuda-nvcc 

# (Optional) additional packages
conda install keras-tuner seaborn

# Deactivate environment
conda deactivate
```


## Update 
```
# Check version
conda --version

# Update conda
conda update conda

# Update packages in 'tfg'
conda activate tfg
conda update --all
```


## Usage 
See [`conda` cheatsheet](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html). Following is a list of most frequently used commands:
 - List all installed packages with source info 
    - Base: `conda list --show-channel-urls` 
    - TensorFlow: `conda list -n tf-gpu --show-channel-urls` 
 - Update all packages
    - Base: `conda update --all`
    - TensorFlow: `conda update –n tfg --all` 
 - Manage packages for TensorFlow: `conda activate tf-gpu` 
    - Install from channel 
       - Default: `conda install <pkg>` 
       - Specific: `conda install -c <channel> <pkg>` 
    - Remove: `conda uninstall <pkg>` 
 - Get package info: `conda search <pkg> --info` 
 - Get help for command: `conda <command> --help` 
