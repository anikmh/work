## Requisites 
- [NordVPN](https://nordvpn.com/cyber-site/)
- [GitHub](./github.md) 


## Install [NordVPN](https://nordvpn.com/cyber-site/)
The following terminal command will add a repository to APT and automatically update with system.
```
# Download and install
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

# Set permission
sudo usermod -aG nordvpn $USER

# Reboot: Ubuntu desktop
sudo reboot

# Reboot: WSL (on PowerShell)
wsl --shutdown

# Check installed version
nordvpn --version

# Login: Ubuntu desktop
nordvpn login
```

For WSL, a token is required for manual login. Visit <https://my.nordaccount.com/dashboard/nordvpn/> and verify email. Then generate a token (if expired) and do:
```
nordvpn login --token <token>
```
Next, configure NordVPN:
```
# Check if logged in
nordvpn account

# Check options
nordvpn settings

# Enable threat protection (free)
nordvpn set threatprotectionlite on

# Enable meshnet (free)
nordvpn set meshnet on

# List of commands
nordvpn --help
```

> See [documentation](https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Raspberry-Pi-Elementary-OS-and-Linux-Mint.htm) for more options with a premium subscription.


## Install [OpenConnect Pulse](https://github.com/utknoxville/openconnect-pulse-gui)
This VPN allows one to route through the UTK network for visiting journal websites that require so. 
> Not required for websites that allow logging in through the UTK website.
```
# Install package and dependencies
sudo apt install python3-gi gir1.2-webkit2-4.0 openconnect

# Go to $HOME
cd ~

# Clone repository
git clone https://github.com/utknoxville/openconnect-pulse-gui.git

# Rename and go to directory
mv openconnect-pulse-gui utvpn
cd utvpn/

# Install vpn
sudo python3 setup.py install

# Connect to vpn
sudo openconnect-pulse-gui access.utk.edu
```

The last command will launch a built-in browser window to login through UTK.


## Update 
```
# Go to directory
cd ~/utvpn/

# Pull from branch
git pull

# Install updates
sudo python3 setup.py install
```
