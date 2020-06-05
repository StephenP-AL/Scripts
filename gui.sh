#! /bin/sh
# Switches grub configuration and reboots in graphical mode
sudo cp ~/scripts/grub/grub.gui /etc/default/grub
sudo update-grub
sudo systemctl set-default graphical.target
sudo killall openvpn
sudo shutdown -r now
