#!/bin/sh

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew bundle

# Setup vim-plug
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
