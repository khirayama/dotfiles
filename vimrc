" https://employment.en-japan.com/engineerhub/entry/2019/01/28/103000
" Index
" - Settings
" - Mapping
" - dein
" - Color
" - denite
" - asyncomplete
" - vim-lsp
" - Syntax
" - ale

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
set completeopt=menu,menuone,noselect,noinsert
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
set ignorecase
set smartcase
set incsearch
set nohlsearch
" Other
set noswapfile
set nobackup
set noerrorbells
" ----- Settings End -----
"
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

" ----- dein Start -----
" [Shougo/dein.vim: Dark powered Vim/Neovim plugin manager](https://github.com/Shougo/dein.vim)
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.cache/dein')
" Need to have
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('Shougo/denite.nvim')
call dein#add('w0rp/ale')
call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/async.vim')
call dein#add('prabirshrestha/vim-lsp')
call dein#add('prabirshrestha/asyncomplete-lsp.vim')
" Nice to have
call dein#add('airblade/vim-gitgutter')
call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-abolish')
call dein#add('lilydjwg/colorizer')
call dein#add('wakatime/vim-wakatime')
" Syntax Highlighter / Completion
call dein#add('leafgarland/typescript-vim')

if !has('nvim')
  " dein, denite
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#end()

if dein#check_install()
  call dein#install()
endif
" ----- dein End -----

" ----- Color Start -----
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
set background=dark
colorscheme hybrid
" ----- Color End -----

" ----- denite Start -----
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
  nnoremap <silent><buffer><expr> <C-l> denite#do_map('redraw')
  nnoremap <silent><buffer><expr> <C-e> denite#do_map('do_action', 'vsplit')
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
" ----- denite End -----

" ----- asyncomplete Start -----
" [prabirshrestha/asyncomplete.vim: async completion in pure vim script for vim8 and neovim](https://github.com/prabirshrestha/asyncomplete.vim)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" ----- asyncomplete End -----

" ----- vim-lsp Start -----
" [prabirshrestha/vim-lsp: async language server protocol plugin for vim and neovim](https://github.com/prabirshrestha/vim-lsp)
" [Vim - vim-lsp で Typescript 開発環境を構築する | Micheam's TechBlog](https://blog.micheam.com/2019/05/21/vim-lsp-setting-for-typescript/)
if executable('typescript-language-server')
  augroup LspTypeScript
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
          \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
          \ 'whitelist': ['typescript'],
          \ })
    autocmd FileType typescript setlocal omnifunc=lsp#complete
  augroup END :echomsg "vim-lsp with `typescript-language-server` enabled"
else
  :echomsg "vim-lsp for typescript unavailable"
endif
" ----- vim-lsp End -----

" ----- Syntax Start -----
au BufNewFile,BufRead *.tsx set ft=typescript
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
" ----- Syntax End -----

" ----- ale Start -----
let g:ale_sign_column_always = 1
let g:ale_cursor_detail = 0
let g:ale_completion_enabled = 0
let g:ale_set_loclist = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 0
let g:ale_echo_cursor = 0
let g:ale_linters = {
\ 'javascript': ['eslint', 'prettier', 'prettier-eslint'],
\ 'typescript': ['eslint', 'prettier'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier'],
\ 'typescript': ['eslint', 'prettier'],
\}
" ----- ale End -----

" ----- Statusline Start -----
set statusline=%t\ %m%r%h%w[%{&fenc}]\ C:%03c\ L:%04l/%04L\ %3p%%
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%d warnings - %d errors',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
set statusline+=\ [%{LinterStatus()}]
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=yellow gui=none ctermfg=black ctermbg=green cterm=none'
" ----- Statusline End -----

" [True color support with (iTerm2 + tmux + Vim) - Tom Lankhorst](https://tomlankhorst.nl/iterm-tmux-vim-true-color/)
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

filetype plugin indent on
syntax enable
