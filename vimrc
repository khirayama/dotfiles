" Index
" - Settings
" - Statusline
" - Mapping
" - Syntax
" - vim-plug
" - Color
" - fzf
" - asyncomplete
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
set laststatus=2
set signcolumn=yes
" Insert
set smartindent
set autoindent
set clipboard+=unnamed
" set clipboard+=unnamedplus
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
set whichwrap=b,s,h,l,<,>,[,]
set splitright
" ----- Settings End -----
"
" ----- Statusline Start -----
" [ステータスラインの表示内容を設定する (statusline, laststatus) | まくまくVimノート](https://maku77.github.io/vim/settings/statusline.html)
" [vimのstatuslineをいじる - Qiita](https://qiita.com/Cj-bc/items/dbe62075474c0e29a777)
set statusline=%f\ %m%r%h%w[%{&fenc}]\ C:%c\ L:%l/%L\ %3p%%

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:errors = l:counts.error + l:counts.style_error
  let l:warnings = l:counts.total - l:errors

  return printf('[LINT - e:%d w:%d]', errors, warnings)
endfunction

function! LspStatus() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()

  let l:errors = l:counts.error
  let l:warnings = l:counts.warning
  let l:information = l:counts.information
  let l:hints = l:counts.hint

  return printf('[LSP - e:%d w:%d i:%d h:%d]', errors, warnings, information, hints)
endfunction

set statusline+=\ %{LspStatus()}
set statusline+=\ %{LinterStatus()}
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=yellow gui=none ctermfg=black ctermbg=green cterm=none'
" ----- Statusline End -----
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

" ----- Syntax Start -----
autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby
autocmd BufNewFile,BufRead *.ts set ft=typescript
autocmd BufNewFile,BufRead *.tsx set ft=typescript.tsx
" ----- Syntax End -----

" ----- vim-plug Start -----
" [junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')
" Need to have
Plug 'w0ng/vim-hybrid'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Nice to have
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'lilydjwg/colorizer'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Syntax Highlight
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()
" ----- vim-plug End -----

" ----- Color Start -----
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
set background=dark
colorscheme hybrid
" ----- Color End -----

" ----- fzf Start -----
" [Vimメモ : fzf（fuzzy finder）と連携するfzf.vimの使い方 - もた日記](https://wonderwall.hatenablog.com/entry/2017/10/07/220000)
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0)

function! DispatchFilesOrGFiles()
  let fzf_preview_options = { 'options': ['--preview-window=up:50%'] }

  if isdirectory("../../.git") || isdirectory("../../../.git") || isdirectory("../../../../.git")
    " 階層が深くなるとexcludeがうまく動かない？
    call fzf#vim#gitfiles(' '.getcwd().' -co --exclude-standard', fzf#vim#with_preview(fzf_preview_options), 1)
  elseif isdirectory(getcwd()."/.git") || isdirectory("../.git") || filereadable('.gitignore')
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
" ----- fzf End -----

" ----- asyncomplete Start -----
" [prabirshrestha/asyncomplete.vim: async completion in pure vim script for vim8 and neovim](https://github.com/prabirshrestha/asyncomplete.vim)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" ----- asyncomplete End -----

" ----- lsp Start -----
let g:lsp_signs_enabled = 1	
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_settings_root_markers = [
\	'package.json',
\	'Cargo.toml',
\	'.git/',
\]

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'allowlist': ['*'],
\ }))
" ----- lsp End -----

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
let g:ale_linters = {
\ 'javascript': ['eslint', 'prettier'],
\ 'typescript': ['eslint', 'prettier'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint', 'prettier'],
\ 'typescript': ['eslint', 'prettier'],
\}
" ----- ale End -----

" [True color support with (iTerm2 + tmux + Vim) - Tom Lankhorst](https://tomlankhorst.nl/iterm-tmux-vim-true-color/)
set notermguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Refs:
" [上達したいVim初心者のための設定・プラグインの見つけ方、学び方〈エディタ実践入門〉 - エンジニアHub｜若手Webエンジニアのキャリアを考える！](https://employment.en-japan.com/engineerhub/entry/2019/01/28/103000)
" [2018年版Life ChangingだったVimプラグインTOP3 — kashew_nuts-blog](https://kashewnuts.github.io/2018/12/02/bp_advent_calender.html)
" [Vim初心者に送るカテゴリ別Vim Pluginまとめ - Qiita](https://qiita.com/lighttiger2505/items/592caac64fd1e1781596)
" [vim＋ctagsでコードのタグジャンプをする方法 - Corgi Lab. ～備忘録のための技術ブログ～](https://corgi-lab.com/linux/vim-ctags/)
