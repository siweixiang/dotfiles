#!/usr/bin/bash



# Installing stuff from AUR
#yaourt -S termite-git infinality-bundle;  
yaourt -S --noconfirm --needed terminess-powerline-font-git netdiscover ettercap mlocate extra-cmake-modules;  

# Copying various configs
cp -rf compton.conf ~/.config/;
cp -rf dunst ~/.config/;
cp -rf ranger ~/.config/;

# TODO
# Do PluginInstall in Vim to install all required plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
cp -rf vimrc ~/.vimrc;

# i3 Wm Stuff
cp -rf i3config ~/.i3/config 
sudo cp -rf i3status.conf /etc/

# ZSH Stuff
cp -rf zshrc ~/.zshrc; 
dircolors -p > ~/.dircolors;
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

