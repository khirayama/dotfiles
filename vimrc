" https://employment.en-japan.com/engineerhub/entry/2019/01/28/103000

" Color
colorscheme original
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Display
set encoding=utf-8
set number
set title
set showmatch
set cursorline
set cursorcolumn
set nowrap
set scrolloff=12
set termguicolors
set ambiwidth=double
" Insert
set smartindent
set autoindent
set clipboard+=unnamed
set bs=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
" Search
set smartcase
set incsearch
" Other
set noswapfile
set nobackup
set noerrorbells

" Dein https://github.com/Shougo/dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
