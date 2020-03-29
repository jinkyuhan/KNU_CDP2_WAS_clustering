#!/bin/bash
cd "$(dirname "$0")"

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line
echo "Vim setup\n"

read -p "Do you want to install Vundle and config with .vimrc file? [y/n] > "
if [ "${REPLY}" == "y" -o "${REPLY}" == "Y" ]
then
    apt install -y git vim
    cd ~
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall
fi

