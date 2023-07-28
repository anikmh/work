To change the screen resolution of GRUB menu,
 1. Press '<font class="brown">C</font>' while on the grub menu 
 2. Run command `videoinfo` 
 3. Record the list of allowed resolutions 
 4. Press '<font class="brown">ESC</font>' and boot Ubuntu 
 5. Terminal: `sudo nano /etc/default/grub` 
 6. Uncomment `GRUB_GFXMODE` and set resolution from list 
 7. Save and exit 
 8. Terminal: `sudo update-grub` 