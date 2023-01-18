" TODO: lspのnext errorへの移動など
" TODO: statuslineにlspのエラーなどの個数を追加
" TODO: lspのline highlightを更新
" TODO: vim-abolishの検討
call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

set number
set nowrap
set clipboard+=unnamed
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set noswapfile
set nobackup
set noerrorbells
set ignorecase
set smartcase
set incsearch
set nohlsearch
set laststatus=2
set signcolumn=yes

imap <C-c> <ESC>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-n> <C-w>>
nmap <C-m> <C-w><

colorscheme codedark

" --- fzf ---
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0)

function! DispatchFilesOrGFiles()
  let fzf_preview_options = { 'options': ['--preview-window=up:50%'] }

  if isdirectory(getcwd()."/.git") || isdirectory("../.git") || filereadable('.gitignore')
    call fzf#vim#gitfiles(' '.getcwd().' -co --exclude-standard -- '.
          \ '":!**/*.png" '.
          \ '":!**/*.jpg" '.
          \ '":!**/*.jpeg" '.
          \ '":!**/*.webp" '.
          \ '":!**/*.gif" '.
          \ '":!**/*.sketch" '.
          \ '', fzf#vim#with_preview(fzf_preview_options), 1)
  else
    call fzf#vim#files(getcwd(), fzf#vim#with_preview(fzf_preview_options), 1)
  endif
endfunction

noremap <C-u> :call DispatchFilesOrGFiles()<CR>

let g:fzf_preview_window = ['up:50%', 'ctrl-/']
let g:fzf_action = { 'ctrl-a': 'vsplit' }

" --- lsp & asyncomplete ---
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
set completeopt=menuone,noinsert,noselect,preview
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 200
let g:lsp_diagnostics_virtual_text_enabled = 0
" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

" --- statusline ---
set statusline=%f\ %m%r%h%w[%{&fenc}]\ %l/%L
