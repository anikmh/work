## About
Nouveau Display Driver is an open-source graphics driver and installed by default during Ubuntu setup, which serves most purposes. However, an Nvidia graphics card requires the proprietary native driver for CUDA/OpenGL support in scientific computing.
___
## Requisites 
None - Nvidia repository is automatically added during system setup.
___
## Installation 
 1. Detect GPU model and list of drivers: `nvidia-detector` 
 2. Identify recommended driver `nvidia-driver-xxx` from list
 3. Install default driver: `sudo apt install nvidia-driver-xxx` 
 4. Reboot the system: `sudo reboot` 
___
### Test 
Verify that the correct driver is enabled in **Additional Drivers**. After reboot, the command `nvidia-smi` should print GPU info. 