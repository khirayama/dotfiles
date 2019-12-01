" https://employment.en-japan.com/engineerhub/entry/2019/01/28/103000

" Display
set encoding = utf-8
set number
set title
set showmatch
set cursorline
set cursorcolumn
set nowrap
set scrolloff = 12
set termguicolors
set ambiwidth = double
" Insert
set smartindent
set autoindent
set clipboard += unnamed
set bs = indent,eol,start
set expandtab
set tabstop = 2
set shiftwidth = 2
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
set runtimepath += ~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('w0ng/vim-hybrid')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Color
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background = dark
colorscheme hybrid
