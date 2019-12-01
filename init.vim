" https://employment.en-japan.com/engineerhub/entry/2019/01/28/103000

" ----- Settings Start -----
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
" ----- Settings End -----

" ----- Dein Start -----
" [Shougo/dein.vim: Dark powered Vim/Neovim plugin manager](https://github.com/Shougo/dein.vim)
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('Shougo/denite.nvim')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" ----- Dein End -----

filetype plugin indent on
syntax enable

" ----- Color Start -----
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
set background=dark
colorscheme hybrid
" ----- Color End -----

" ----- Denite Start -----
" [Shougo/denite.nvim: Dark powered asynchronous unite all interfaces for Neovim/Vim8](https://github.com/Shougo/denite.nvim)
" [unite.vim, ctrlp.vim から neovim と denite.nvim へ引越した - 藻ログ](http://wakame.hatenablog.jp/entry/2017/05/04/144550)
" [dein.vimへの道.md](https://gist.github.com/Fendo181/6f44ebe0a4e08f49f194a837608c4936)
" [unite.vimより高速なdenite.nvimを使う](https://qiita.com/okamos/items/4e1665ecd416ef77df7c)
" [uniteからdeniteに移行したメモ](https://qiita.com/hisawa/items/3498951e84eac77ac890)
" [【Vim】新しい Denite に爆速で対応する](https://qiita.com/delphinus/items/de15250b39ac08e9c0b9)
" [denite.nvim + ag な file/rec の設定をさらに爆速にする](https://qiita.com/hrsh7th@github/items/e405b4f4228e10a43201)
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
endfunction

call denite#custom#alias('source', 'file/git', 'file/rec')
call denite#custom#var('file/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git") || isdirectory("./.git") || isdirectory("../.git") || isdirectory("../../.git")
    Denite file/git -start-filter -direction=topleft
  else
    Denite file/rec -start-filter -direction=topleft
  endif
endfunction

noremap <C-u> :call DispatchUniteFileRecAsyncOrGit()<CR>
" ----- Denite End -----

" ----- Mapping Start -----
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-n> <C-w>>
nmap <C-m> <C-w><
" ----- Mapping End -----
