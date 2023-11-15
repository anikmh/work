## Requisites 
 - Repository: [GitHub](./github.md) 
 - Installer: python3-pip` 
 - Base: `openconnect`
 - System-Python: `python3-gi gir1.2-webkit2-4.0` 


## Installation 
 1. Install OpenConnect: `sudo apt install openconnect` 
 2. Clone [repository](https://github.com/utknoxville/openconnect-pulse-gui): `git clone https://github.com/utknoxville/openconnect-pulse-gui.git` 
 3. Rename and goto: `mv openconnect-pulse-gui utvpn; cd utvpn/` 
 4. Install VPN: `sudo python3 setup.py install` 


## Usage 
Disconnect any other VPN and then run: 
`sudo openconnect-pulse-gui access.utk.edu` 


## Update 
```
cd ~/utkvpn/
git pull
sudo python3 setup.py install
```
