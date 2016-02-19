#!/usr/bin/bash

# Installing stuff from AUR
yaourt -S termite-git infinality-bundle;  
yaourt -S --noconfirm --needed terminess-powerline-font-git netdiscover ettercap mlocate extra-cmake-modules mpv-git;  

# Copying various configs
cp -rf compton.conf ~/.config/;
cp -rf dunst ~/.config/;
cp -rf ranger ~/.config/;
cp -rf termite ~/.config/;
cp -rf livestreamerrc ~/.config/.livestreamerrc;

# i3 Wm Stuff
cp -rf i3config ~/.i3/config 
sudo cp -rf i3status.conf /etc/


# TODO
# 1) Do PluginInstall in Vim to install all required plugins
# 2) Execute the following command in ~/.vim/bundle/YouCompleteMe/
# python2 install.py --clang-completer --tern-completer
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
cp -rf vimrc ~/.vimrc;


# Disable pulse audio from listening on the network by comment out the line below from /etc/pulse/default.pa
# load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1

# ZSH Stuff
cp -rf zshrc ~/.zshrc; 
dircolors -p > ~/.dircolors;
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# Firefox nightly extensions
# SSleuth, UBlock Origin, Self Destructing Cookies, NoScript, HTTPS Everywhere, Ghostery, Random Agent Spoofer


