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
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production', 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'json', 'html'] }
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
set scrolloff=12
set splitright

inoremap <C-c> <ESC>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-n> <C-w>>
nmap <C-m> <C-w><

colorscheme codedark
filetype plugin indent on

" --- fzf ---
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0)
function! DispatchFilesOrGFiles()
  let cwd = getcwd()
  let p = {'options': ['--preview-window=up:50%'], 'window': {'width': 1, 'height': 1}}
  let g = isdirectory(cwd.'/.git') || isdirectory('../.git') || filereadable('.gitignore')
  let excludes = join(map(['png', 'jpg', 'jpeg', 'webp', 'gif', 'sketch'], '"\":!**/*." . v:val . "\""'), ' ')

  if g
    call fzf#vim#gitfiles(' '.cwd.' -co --exclude-standard -- '.excludes, fzf#vim#with_preview(p), 0)
  else
    call fzf#vim#files(cwd, fzf#vim#with_preview(p), 0)
  endif
endfunction
noremap <C-u> :call DispatchFilesOrGFiles()<CR>
let g:fzf_preview_window = ['up:50%', 'ctrl-/']
let g:fzf_action = { 'ctrl-a': 'vsplit' }

" --- asyncomplete ---
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
set completeopt=menuone,noinsert,noselect,preview

" --- vim-lsp ---
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 200
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
nnoremap <C-]> :LspNextDiagnostic<CR>
nnoremap <C-[> :LspPreviousDiagnostic<CR>
highlight link LspErrorHighlight Error
highlight link LspWarningHighlight Error
highlight link LspInformationHighlight Error
highlight link LspHintHighlight Error
let g:lsp_diagnostics_signs_error = {'text': '❌'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠️'}
let g:lsp_diagnostics_signs_information = { 'text': 'ℹ️' }
let g:lsp_diagnostics_signs_hint = { 'text': '🔈' }
set updatetime=300

" --- vim-prettier ---
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#filetype_ignore = ['markdown']

" --- statusline ---
set statusline=%f\ L:%l/%L\ E:%{lsp#get_buffer_diagnostics_counts().error}\ W:%{lsp#get_buffer_diagnostics_counts().warning}\ I:%{lsp#get_buffer_diagnostics_counts().information}\ H:%{lsp#get_buffer_diagnostics_counts().hint}
