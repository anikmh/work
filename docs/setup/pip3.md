<span class="red">DEPRECATED: This package is no longer being used. Some global Python packages are now managed with APT, while all other local packages with Conda in a virtual environment.</span>
(see [conda.md](./conda.md) documentation)

## About
Package manager for user-specific Python libraries. 

## Prerequisite  
 - `python3-pip` 

## Installation 
 1. System-wide (`/usr/bin/pip`): `sudo apt install python3-pip` 
 2. User-specific (`/usr/local/bin/pip`): `sudo pip install pip` 

## Usage 
 - Install `<pkg>` in
    - (`/usr/local/lib/`): `sudo pip install <pkg>`  (not recommended)
    - (`~/.local/lib/`): `pip install <pkg>` 
 - List packages
    - Installed 
      - Global: `pip list` 
      - Local: `pip list --user` 
    - Outdated: `pip list --outdated` 

## Upgrade 
 1. `pip install --upgrade pip` 
 2. `pip install --upgrade <pkg>` 