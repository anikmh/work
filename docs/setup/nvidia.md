## About
Nouveau Display Driver is an open-source graphics driver and installed by default during Ubuntu setup, which is stable and serves most purposes. However, the proprietary native driver is required for CUDA/OpenGL support in scientific computing.
___

## Requisites 
None - Nvidia repository is automatically added during system setup (i.e. if opted to "Install third-party softwares").
___

## Installation 
The following methods are tested and verified.
#### Method-1: Software Updater
Safest way to install is using the GUI application:
 1. Launch Software Updater > Settings > Additional Drivers
 2. Select `nvidia-driver-525 (proprietary)` and then click on Apply Changes
 3. Reboot the system immediately
#### Method-2: Terminal
<span class="red">This method is discouraged in order to avoid accidental mistakes and system failure:</span>
 1. Detect GPU model and list of drivers: `nvidia-detector` 
 2. Identify recommended driver `nvidia-driver-xxx` from list
 3. Install default driver: `sudo apt install nvidia-driver-xxx` 
 4. Reboot the system: `sudo reboot` 
___

### Test 
Verify that the correct driver is enabled in **Additional Drivers**. After reboot, the command `nvidia-smi` should print GPU info. 