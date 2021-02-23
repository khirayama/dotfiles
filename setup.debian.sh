#!/bin/sh

sudo apt update
sudo apt install -y zsh tmux direnv fzf build-essential sysstat mosh unzip wget tree curl openssh-server vim-gtk

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/colors

ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/vimrc ~/.config/nvim/init.vim
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/eslintrc ~/.eslintrc
ln -sf $PWD/ctags ~/.ctags

# Install nvm. https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

# Install ngrok. https://ngrok.com/download
# ngrok https://dashboard.ngrok.com/
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
