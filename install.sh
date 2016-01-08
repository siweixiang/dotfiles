#!/usr/bin/bash
cp -rf compton.conf ~/.config/;
cp -rf dunst ~/.config/;
cp -rf ranger ~/.config/;

# Do PluginInstall in Vim to install all required plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
cp -rf .vimrc ~/;

# i3 Wm Stuff
cp -rf config ~/.i3/  
cp -rf i3status.conf /etc/

# ZSH Stuff
cp -rf .zshrc ~/;         
dircolors -p > ~/.dircolors;
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

