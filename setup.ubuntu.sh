#!/bin/sh
sudo apt update
sudo apt install -y zsh wslu language-pack-ja locales vim-gtk3 openjdk-21-jdk
sudo locale-gen ja_JP.UTF-8
sudo update-locale LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8
chsh -s $(which zsh)

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/colors
mkdir -p ~/.github/copilot

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Setup LazyVim for nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

ln -sf $PWD/zshrc.ubuntu ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/vimrc.ubuntu ~/.vimrc
ln -sf $PWD/init.lua ~/.config/nvim/init.lua
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/eslintrc ~/.eslintrc
