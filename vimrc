if &compatible
  set nocompatible
endif
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim') " uniteで必要らしい
call dein#add('Shougo/unite.vim') " 高機能なファイラらしい
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('airblade/vim-gitgutter') " Gitの差分を表示
call dein#add('tomtom/tcomment_vim') " ctrl--でコメントアウトできるように
call dein#add('tpope/vim-surround') " csで囲みを変更
call dein#add('tpope/vim-abolish') " キャメル - スネークなどを変換するのを持ってるやつ
call dein#add('haya14busa/incsearch.vim') " 便利なインクリメンタルサーチ
call dein#add('lilydjwg/colorizer') " colorを表示

call dein#add('wakatime/vim-wakatime')

" Syntax Highlighter
call dein#add('w0rp/ale')
call dein#add('othree/yajs.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('flowtype/vim-flow', {'autoload': {'filetypes': 'javascript'}})
call dein#add('mxw/vim-jsx')
call dein#add('leafgarland/typescript-vim')
call dein#add('Quramy/tsuquyomi')
call dein#add('fatih/vim-go')
call dein#add('rust-lang/rust.vim')
call dein#add('udalov/kotlin-vim')
call dein#add('digitaltoad/vim-pug')

" Color
" call dein#add('w0ng/vim-hybrid') " テーマ

call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" options
set tags+=.git/tags
set ambiwidth=double
set t_Co=256
set number " 行番号の表示
set title " ウィンドウに現在のファイル名を追加
set showmatch " 対応する括弧を強調表示
set tabstop=2 " タブ文字の埋める幅
set smartindent " 次の行のインデントを合わせる
set completeopt=menuone
set clipboard+=unnamed " ヤンクの時にクリップボードを使用
set bs=indent,eol,start " backspaceを有効に
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set cursorline " カーソル行の色を変更
set cursorcolumn " カーソル位置のカラムの色を変更
set laststatus=2 " ステータス行を常に表示
set cmdheight=1 " メッセージを1行確保
set scrolloff=12 " 上下12行を常に確保
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない"
set nowrap " 折り返し禁止
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅"
set smartindent " 改行時にインデントを増減する
set autoindent " 改行時にインデントを継続する
set noswapfile " swapファイルを作成しない
set ignorecase "  検索時大文字小文字を区別しない
set smartcase " 大文字小文字が混ざったときは区別する
set incsearch " インクリメンタルサーチをonに
set mouse=a " マウス操作を有効化
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
set background=dark
set synmaxcol=300
set updatetime=100
" set nonumber " 行番号の表示
" set wrap " 折り返し
" set breakindent " 折り返し時にインデントを揃える
source $VIMRUNTIME/macros/matchit.vim
colorscheme original
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax on

"---------------------------------------------------
" Config
"---------------------------------------------------
" Read local vimrc
if filereadable("./.vimrc") && $HOME != getcwd()
  source .vimrc
endif

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=#E57373 ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"---------------------------------------------------
" Markup
"---------------------------------------------------
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
autocmd FileType erb inoremap <silent> <buffer> </ </<C-x><C-o>

"---------------------------------------------------
"  Normal mode
"---------------------------------------------------
" 検索などで飛んだらそこを真ん中に
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

"----------------------------------------------------
"  unite.vim
"----------------------------------------------------
au FileType unite nnoremap <silent> <buffer> <expr> <C-e> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-e> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

let s:unite_ignore_patterns='\.\(pdf\|gif\|jpeg\|jpg\|png\|webp\|woff2\|ico\?n\|xlsx\|ai\|DS_Store\|svg\)$'

function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git") || isdirectory("./.git") || isdirectory("../.git") || isdirectory("../../.git")
    Unite buffer file_rec/git file/new -start-insert
  else
    Unite buffer file_rec/async file/new -start-insert
  endif
endfunction

call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)
call unite#custom#source('file_rec/async', 'ignore_pattern', s:unite_ignore_patterns)

noremap <C-p> :Unite file_mru -buffer-name=file_mru -start-insert<CR>
noremap <C-u> :call DispatchUniteFileRecAsyncOrGit()<CR>

"----------------------------------------------------
"  neocomplete
"----------------------------------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.default = '\v\h\w*'
let g:neocomplete#force_omni_input_patterns.javascript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.go = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"----------------------------------------------------
" Syntax Checker
"----------------------------------------------------
au BufNewFile,BufRead *.tsx set ft=typescript
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters#javascript = ['eslint', 'flow', 'prettier', 'prettier-eslint']
let g:ale_linters#typescript = ['prettier', 'tslint', 'tsserver', 'typescheck']

"----------------------------------------------------
" GitGutter
"----------------------------------------------------
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

"----------------------------------------------------
" incsearch
"----------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"----------------------------------------------------
" Statusline
"----------------------------------------------------
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
