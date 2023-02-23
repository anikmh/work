## Initial setup 
Enable all Ubuntu `apt` repositories for more softwares with automatic updates:
 - Main: Added by default
 - Universe: `sudo add-apt-repository universe` 
 - Multiverse: `sudo add-apt-repository multiverse` 
 - Restricted: `sudo add-apt-repository restricted` 

Check and see explanations here: <span class="purple">Software & Updates</span> > <span class="purple">Ubuntu Software</span>.
___

## `deb` apps
For the following apps, get `.deb` files from official websites:
 - [Edge](https://www.microsoft.com/en-us/edge/download?form=MA13FJ) - `microsoft-edge-stable_<version>_amd64.deb` 
 - [Chrome](https://www.google.com/chrome/) - `google-chrome-stable_current_amd64.deb` 
 - [Firefox](./firefox.md) - See documentation
 - [Code](https://code.visualstudio.com/Download) - `code_<version>_amd64.deb` 
 - [Slack](https://slack.com/downloads/linux) - `slack-desktop-<version>-amd64.deb` [<font color="gray">Note: See troubleshooting below</font>] 
 - [Zoom](https://zoom.us/support/download) - `zoom_amd64.deb` [<font color="gray">Note: Requires manual update</font>]
 - [Discord](https://discord.com/download) - `discord-<version>.deb` 

To install: `sudo apt install ./<app>.deb`.  
___

## `apt` apps and CLIs
 - VLC Media Player: `sudo apt install vlc` 
 - GNU Plot: `sudo apt install gnuplot` 
 - CLIs: `sudo apt install mlocate inxi curl dbus-x11 libfuse2` 
    - `mlocate`: Find files more easily
    - `inxi`: Check system info
    - `curl`: Transfer data to/from servers
    - `dbus-x11`: Support for `gedit` (unverified)
    - `libfuse2`: To run app images
___

## `snapd` apps
 - Spotify: `sudo snap install spotify` 
___

## `appImage` apps
 - Install AppImage: 
   `sudo add-apt-repository ppa:appimagelauncher-team/stable`
   `sudo apt install appimagelauncher` 
 - Download preferred app images
 - Launch app image: `./<appname>.AppImage` 
 - Choose the default location 
 - Click on "Integrate and Run"
___

### Troubleshooting Slack
To remove the warning "`W: https://packagecloud.io/slacktechnologies/slack/debian/dists/jessie/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.`", 
do the followings: 
 1. Find the deprecated key of Slack 
    `sudo apt-key list` 
 2. There should be two public keys in `/etc/apt/trusted.gpg`. The expired key can be ignored.
 3. Copy the last 8 characters (038651BD) of the unexpired public key
 4. Convert and export key to `trusted.gpg.d` 
    `sudo apt-key export 038651BD | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/slack.gpg`
 4. Delete the original key 
    `sudo apt-key --keyring /etc/apt/trusted.gpg del 038651BD` 
 5. Run `apt update` as usual and the warning should be gone 
___
