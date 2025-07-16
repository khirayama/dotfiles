#!/bin/sh

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/colors
mkdir -p ~/.github/copilot

# Setup vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Setup LazyVim for nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/init.lua ~/.config/nvim/init.lua
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/eslintrc ~/.eslintrc
