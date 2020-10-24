#!/bin/sh

sudo apt update
sudo apt install zsh tmux direnv fzf build-essential sysstat mosh unzip git wget

sudo timedatectl set-timezone Asia/Tokyo
sudo locale-gen ja_JP.UTF-8

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

# ngrok https://dashboard.ngrok.com/
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
