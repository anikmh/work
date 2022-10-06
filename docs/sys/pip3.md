## Info
Package manager for user-specific Python libraries. 
___
## Prerequisite  
 - `python3-pip` 
___
## Installation 
 1. System-wide (`/usr/bin/pip`): `sudo apt install python3-pip` 
 2. User-specific (`/usr/local/bin/pip`): `sudo pip install pip` 
___
## Usage 
 - Install `<pkg>` in
    - (`/usr/local/lib/`): `sudo pip install <pkg>` 
    - (`~/.local/lib/`): `pip install <pkg>` 
 - List packages
    - Installed 
      - Global: `pip list` 
      - Local: `pip list --user` 
    - Outdated: `pip list --outdated` 
___
## Upgrade 
 1. `sudo pip install --upgrade pip` 
 2. `sudo pip install --upgrade <pkg>` 
