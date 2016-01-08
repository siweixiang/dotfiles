#!/usr/bin/bash

# Infinality fonts installation

echo '[infinality-bundle]' >> /etc/pacman.conf;
echo 'Server = http://bohoomil.com/repo/$arch' >> /etc/pacman.conf;

pacman-key --populate && pacman-key --refresh && pacman-key -r 962DDE58 && pacman-key --lsign-key 962DDE58 && pacman -Syy && pacman --noconfirm zsh infinality-bundle thunderbird vlc wireshark-gtk cmus mplayer youtube-viewer calibre livestreamer nethogs mlocate nodejs npm lm_sensors transmission-gtk macchanger aircrack-ng gcolor2 calibre arp-scan whois nmap automake cmake clang llvm extra-cmake-modules ranger termite wine redshift dunst ufw gufw;
 
# Wireless automation scripts
 cp FixIntel.sh /usr/bin/ &&  cp FixAlpha.sh /usr/bin/ &&  cp configure.sh /usr/bin/;

yaourt --noconfirm terminess-powerline-font-git netdiscover ettercap

# Blacklisting webcam and bluetooth modules
cp -rf blacklist*.conf /etc/modprobe.d/

# TODO 1) Automate /etc/default/grub with flags from grub_conf
#	   2) Automate installing inox extensions
