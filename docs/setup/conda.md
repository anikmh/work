## About 
Anaconda is an open-source distribution of packages and libraries for Python and R programming suitable for scientific computing. It contains built-in package and virtual-environment manager along with user-friendly interface, making package management safe and simple. The purpose of `anaconda3` in this system is to deploy TensorFlow, a powerful machine-learning tool, with GPU support while avoiding inference with system-Python. `conda` is a smart and advanced CLI superior to `pip` that makes such deployment a breeze. 
___
## Requisites 
 - For TensorFlow with GPU: [Nvidia driver](./nvidia.md) 
 - (Optional) For GUI packages: `libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6` 
___
## Installation 
 1. Download latest installer from official [website](https://www.anaconda.com/products/distribution).
 2. Verify that downloaded file matches [SHA-256 hash](https://docs.continuum.io/anaconda/install/hashes/all/): 
    `sha256sum Anaconda3-latest-Linux-x86_64.sh` 
 3. Install in `~/`: `bash Anaconda3-latest-Linux-x86_64.sh` 
 4. Allow initialization during installation: `conda init` 
 5. Source `bashrc` or restart terminal: `source ~/.bashrc` 
 6. Disable automatic activation of `base` environment on terminal launch:
    `conda config --set auto_activate_base false` 
___
## Test 
Command `conda info` should print configuration. Also check `conda --version`.
___
## Setup
 1. Install `tensorflow-gpu` in a virtual environment: 
    `conda create -n tf-gpu tensorflow-gpu` 
 2. Activate `tf-gpu` environment: `conda activate tf-gpu` 
 3. Install Matplotlib for plotting: `conda install matplotlib` 
 4. Install JupyterLab for notebook: `conda install jupyterlab` 
 5. Install Keras Tuner for tuning: `conda install -c conda-forge keras-tuner` 
 6. Intall Pandas to process data files: `conda install -c anaconda pandas` 
 7. Deactivate environment: `conda deactivate` 
___
## Upgrade 
 - Check version: `conda --version` 
 - Update conda: `conda update conda` 
___
## Usage 
See [`conda` cheatsheet](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html). Following is a list of most frequently used commands:
 - List all installed packages with source info 
    - Generic: `conda list --show-channel-urls` 
    - TensorFlow: `conda list -n tf-gpu --show-channel-urls` 
 - Update all packages
    - Generic: `conda update --all`
    - TensorFlow: `conda update –n tf-gpu --all` 
 - Manage packages for TensorFlow: `conda activate tf-gpu` 
    - Install from channel 
       - Default: `conda install <pkg>` 
       - Specific: `conda install -c <channel> <pkg>` 
    - Remove: `conda uninstall <pkg>` 
 - Get package info: `conda search <pkg> --info` 
 - Get help for command: `conda <command> --help` 