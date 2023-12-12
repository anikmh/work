## Requisites 
 - A device with SSH access to host/remote servers
 - For Meshnet: [NordVPN](https://nordvpn.com/) account


## Client setup
1. Generate keys on local client: 

```
ssh-keygen –t rsa
```

2. Use default name and location: `~/.ssh/id_rsa` 
3. When prompted to generate password, hit Enter to skip 
4. Check if the generated keys are located in `~/.ssh/` 
5. Create a `config` file in `~/.ssh/` containing the followings:

```
Host iso
Hostname isospin.roam.utk.edu
User anikmh
IdentityFile /home/anik/.ssh/id_rsa
ServerAliveInterval 60

Host neu
Hostname neutrino.desktop.utk.edu
User anikmh
IdentityFile /home/anik/.ssh/id_rsa
ServerAliveInterval 60

Host isc
Hostname acf-login.nics.utk.edu
User anik
ServerAliveInterval 60

Host br2
Hostname bridges2.psc.edu
User manik
ServerAliveInterval 60
```

6. Append public key to `~/.ssh/authorized_keys` on host, using the device with access to host
7. Check permissions for files in `~/.ssh/`: 

```
chmod 644 id_rsa.pub
chmod 600 id_rsa known_hosts config
```

8. Connect to host/remote desktops Isospin/Neutrino: 
```
ssh <host>
``` 
9. Type 'yes' to prompt for first-time authentication 


## Server setup
Be sure to follow the above steps first to generate SSH keys. 

```
# Install SSH (if not installed e.g. on WSL)
sudo apt install ssh

# Install server (if not installed)
sudo apt install openssh-server

# Check service status 
sudo systemctl status ssh

# If not running, start service
sudo systemctl enable --now ssh

# Enable firewall for security (if not enabled)
sudo ufw enable

# Allow SSH through firewall 
sudo ufw allow ssh
```

Next, create a file `~/.ssh/authorized_keys` (if does not exist), and append the public key. Then set permission for this file: 
```
chmod 600 authorized_keys
```

If both host and client are connected to the same network (WiFi/Ethernet), simply connect locally:
```
ssh <host>
``` 

Otherwise, follow the steps below to set up Meshnet with NordVPN to access devices globally through SSH tunneling.


## Meshnet setup
Install NordVPN first by following the steps in [VPN](./vpn.md). Meshnet is a free tool provided by NordVPN, which requires only a free account and no premium subscriptions.
```
# Check current settings
nordvpn settings

# Enable meshnet
nordvpn set meshnet on

# See list of linked devices
nordvpn meshnet peer list
```

Alternatively, visit <https://my.nordaccount.com/dashboard/nordvpn/meshnet/>, and find the IP address or alias of the host and client devices to be linked.

Next, configure permissions for Meshnet on both host and client:
```
# Enable incoming traffic
nordvpn meshnet peer incoming allow <device>

# Enable file sharing
nordvpn meshnet peer fileshare allow <device>

# Enable auto-accept file transfers
nordvpn meshnet peer auto-accept enable <device>

# Enable traffic routing
nordvpn meshnet peer routing allow <device>
nordvpn meshnet peer local allow <device>
```

Next, append the following to `~/.ssh/config` (see above):
```
Host zen
Hostname anikmh1-alps.nord
User anik
ServerAliveInterval 60
```

Finally, connect to the host:
```
ssh zen
```

 > Documentations: <https://meshnet.nordvpn.com/>