Install Firefox as a `deb` app and customize as necessary.
___
- First, remove Firefox from snap 
  `sudo snap remove --purge firefox` 
- Add Mozilla's PPA repository 
  `sudo add-apt-repository ppa:mozillateam/ppa` 
- Prioritize installation from PPA over snap 
  `echo ' Package: * Pin: release o=LP-PPA-mozillateam Pin-Priority: 1001 ' | sudo tee /etc/apt/preferences.d/mozilla-firefox` 
- Force-enable automatic updates 
  `echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox` 
- Install Firefox as deb with APT 
  `sudo apt update && sudo apt install firefox` 
- Enable additional codecs support for Firefox (e.g. to play a wider range of videos across websites). Enable respository `multiverse` (see [Initial Setup](./apps.md)).
  `sudo apt install ubuntu-restricted-extras` 
- Add the following extensions for more customizations:
   - [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/): Efficient wide-range content blocker
   - [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/): Dark mode for all websites
   - [Tree Style Tab](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/): For vertical tabs (grouped)
   - [AdGuard AdBlocker](https://addons.mozilla.org/en-US/firefox/addon/adguard-adblocker/): Block more ads on social websites
   - [Tabliss](https://addons.mozilla.org/en-US/firefox/addon/tabliss/): Add background and widgets on new tabs
