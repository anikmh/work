## Requisites 
 - Access to host/remote servers: Isospin/Neutrino/GitHub
___
## Setup
- Generate keys on local client: `ssh-keygen –t rsa` 
- Use default name and location: `~/.ssh/id_rsa` 
- Create new passphrase and re-enter to confirm 
- Check generated keys in `~/.ssh/` 
- Add keys to authentication agent: `ssh-add id_rsa` 
  (Optional if using a config file)
- Copy the [config](https://github.com/anikmh/wd/blob/main/.ssh/config) file to `~/.ssh/`  
- Append client's public key to `id_rsa.pub` and `authorized_keys` on host 
- Connect to remote desktops Isospin/Neutrino: `ssh Host` 
- Type 'yes' to prompt for first-time authentication 
- Set correct permissions for files in `~/.ssh/`: 
  `chmod 644 id_rsa.pub` 
  `chmod 600 id_rsa` 
  `chmod 600 known_hosts` 
  `chmod 600 config` 