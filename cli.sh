#! /bin/sh
#Swaps out the current grub configuration and reboots in CLI mode
sudo cp ~/scripts/grub/grub.cli /etc/default/grub
sudo update-grub
sudo systemctl set-default multi-user.target
sudo killall openvpn
sudo shutdown -r now
