#!/bin/sh

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew packages
brew bunlde

# Install dein(https://github.com/Shougo/dein.vim)
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/colors

ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/tmux.conf ~/.tmux.conf
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/original.vim ~/.vim/colors/original.vim
ln -sf $PWD/init.vim ~/.config/nvim/init.vim
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/eslintrc ~/.eslintrc
