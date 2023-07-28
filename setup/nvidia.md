## About
Nouveau Display Driver is an open-source graphics driver and installed by default during Ubuntu setup, which is stable and serves most purposes. However, the proprietary native driver is required for CUDA/OpenGL support in scientific computing.
___

## Requisites 
None - Nvidia repository is automatically added during system setup (i.e. if opted to "Install third-party softwares").
___

## First-time Installation 
The following methods are tested and verified.

#### Method-1: GUI
Safest way to install is using the GUI application:
 1. Launch Software Updater > Settings > Additional Drivers
 2. Select `nvidia-driver-xxx (proprietary, tested)` and then click on Apply Changes
 3. Reboot the system immediately

#### Method-2: CLI
<span class="yellow">This method is advised for a clean installation or just a reinstallation:</span>
One-line command (safest): `sudo apt remove --purge nvidia* && sudo ubuntu-drivers autoinstall && sudo reboot`
 1. Uninstall existing/incorrect driver (if any): `sudo apt remove --purge nvidia*` 
 2. Automatically install recommended driver and its dependencies: `sudo ubuntu-drivers autoinstall` 
 3. Reboot the system: `sudo reboot`  
___

### Test 
Verify that the correct driver is enabled in **Additional Drivers**. After reboot, the command `nvidia-smi` should print GPU info. 