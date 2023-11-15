### Requisites 
 - For client: Access to host/remote servers
 - For server: `openssh-server`, [NordVPN](https://nordvpn.com/)


### Client setup
- Generate keys on local client: `ssh-keygen –t rsa` 
- Use default name and location: `~/.ssh/id_rsa` 
- When prompted to generate password, hit Enter to skip 
- Check generated keys in `~/.ssh/` 
- Copy the [config](https://github.com/anikmh/wd/blob/main/.ssh/config) file to `~/.ssh/` 
- Append public key to `~/.ssh/authorized_keys` on host 
- Connect to remote desktops Isospin/Neutrino: `ssh Host` 
- Type 'yes' to prompt for first-time authentication 
- Set correct permissions for files in `~/.ssh/`: 
  `chmod 644 id_rsa.pub` 
  `chmod 600 id_rsa` 
  `chmod 600 known_hosts` 
  `chmod 600 config` 


### Server setup
 - Install OpenSSH: `sudo apt install openssh-server` 
 - Check service status: `sudo systemctl status ssh` 
 - If not running, activate: `sudo systemctl enable --now ssh` 
 - Allow SSH through firewall: `sudo ufw allow ssh` 
 - If firewall is disabled, see section in [desktop.md](./desktop.md)
 - Append public key to `~/.ssh/authorized_keys` 
 - If `authorized_keys` does not exist, create one
 - Set correct permission for this file: `chmod 600 authorized_keys`

If both host and client are using the same network (WiFi/Ethernet), simply connect: `ssh Host`. Otherwise, follow the steps below to use SSH tunneling through different networks:
 - Install by either downloading [NordVPN](https://nordvpn.com/download/) and by doing either: 
   ```
   cd /opt/
   sudo mv ~/Downloads/*.deb .
   sudo apt install ./<app>.deb
   sudo rm *.deb
   ```
   or (but not both): `sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)`
 - Set permission for NordVPN: `sudo usermod -aG nordvpn $USER` 
 - Reboot the system: `sudo reboot` 
 - Log into NordVPN: `nordvpn login` 
 - Enable MeshNet: `nordvpn set meshnet on` 
 - Find MeshNet IP address for this machine in [NordVPN account](https://my.nordaccount.com/dashboard/nordvpn/meshnet/)
 - Add IP address to Hostname in `~/.ssh/config` 
 - Connect: `ssh Host` 