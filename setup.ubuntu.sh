#!/bin/sh

sudo apt install zsh tmux direnv

timedatectl set-timezone Asia/Tokyo

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
