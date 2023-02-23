## About 
Use `anaconda3`/`miniconda3` to deploy TensorFlow, a powerful machine-learning tool, with GPU support while avoiding inference with system-packages. `conda` is a smart and advanced CLI superior to `pip` that makes such deployment a breeze. 
___

## Requisites 
 - For TensorFlow with GPU: [Nvidia driver](./nvidia.md) 
 - (Optional) For GUI packages: `libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6` 
___

## Installation 
 1. Download the latest [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installer for Linux with preferred Python version 3.XX
 2. Check SHA-256 hash of installer to verify correct version for Python 3.XX in step-1:
    `sha256sum Miniconda3-latest-Linux-x86_64.sh` 
 3. Install in `~/mconda3`: `bash Miniconda3-latest-Linux-x86_64.sh` 
 4. Allow initialization during installation: `conda init` 
 5. Source `bashrc` or restart terminal: `source ~/.bashrc` 
 6. Disable automatic activation of `base` environment on terminal launch:
    `conda config --set auto_activate_base false` 
___

## Test 
Command `conda info` should print configuration. Also check `conda --version`.
___

## Setup
 1. Add channel `conda-forge` that contains most recent packages:
    `conda config --add channels conda-forge` 
 2. Install `tensorflow-gpu` in a virtual environment: 
    `conda create -n tfg tensorflow-gpu` 
 3. Verify that all packages are from `conda-forge` 
 4. Activate `tfg` environment: `conda activate tfg` 
 5. (Optional) Install additional packages: 
     - Matplotlib for plotting: `conda install matplotlib` 
     - JupyterLab for notebook: `conda install jupyterlab` 
     - KerasTuner for tuning: `conda install keras-tuner` 
     - Pandas for processing data: `conda install pandas`
 6. Deactivate environment: `conda deactivate` 
___

## Upgrade 
 - Check version: `conda --version` 
 - Update conda: `conda update conda` 
 - Packages in `tfg`: `conda activate tfg; conda update --all` 
___

## Usage 
See [`conda` cheatsheet](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html). Following is a list of most frequently used commands:
 - List all installed packages with source info 
    - Generic: `conda list --show-channel-urls` 
    - TensorFlow: `conda list -n tf-gpu --show-channel-urls` 
 - Update all packages
    - Generic: `conda update --all`
    - TensorFlow: `conda update –n tfg --all` 
 - Manage packages for TensorFlow: `conda activate tf-gpu` 
    - Install from channel 
       - Default: `conda install <pkg>` 
       - Specific: `conda install -c <channel> <pkg>` 
    - Remove: `conda uninstall <pkg>` 
 - Get package info: `conda search <pkg> --info` 
 - Get help for command: `conda <command> --help` 
