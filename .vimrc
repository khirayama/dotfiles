" NeoBundle Settings --------------------------------------------------
if !1 | finish | endif
 if has('vim_starting')
   if &compatible
     set nocompatible" Be iMproved
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif
call neobundle#begin(expand('~/.vim/bundle/neobundle.vim/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins
NeoBundle 'Shougo/neomru.vim' " uniteで必要らしい
NeoBundle 'Shougo/unite.vim' " 高機能なファイラらしい
" NeoBundle 'ctrlpvim/ctrlp.vim' " シンプルなファイラらしい
NeoBundle 'Shougo/neocomplcache' " 入力補完
NeoBundle 'Shougo/vimproc.vim', {'build' : {'windows' : 'tools\\update-dll-mingw', 'cygwin' : 'make -f make_cygwin.mak', 'mac' : 'make -f make_mac.mak', 'linux' : 'make', 'unix' : 'gmake', },}
NeoBundle 'Shougo/neosnippet' " snippet補完
NeoBundle 'Shougo/neosnippet-snippets' " neosnippet用snippets集
NeoBundle 'scrooloose/syntastic' " 構文チェック
NeoBundle 'scrooloose/nerdtree' " 便利なファイルアクセス
NeoBundle 'Townk/vim-autoclose' " 括弧等の自動補完
NeoBundle 'mattn/emmet-vim' " vim用emmet
NeoBundle 'kannokanno/previm' " Markdownプレビュー
NeoBundle 'tyru/open-browser.vim' " ブラウザオープンするっぽい
NeoBundle 'airblade/vim-gitgutter' " Gitの差分を表示
NeoBundle 'git://github.com/miripiruni/csscomb-for-vim.git' " CSSの並び順を整形
NeoBundle 'szw/vim-tags' " ctagsを便利に使う
NeoBundle 'rking/ag.vim' " agをvimで使えるように
NeoBundle 'tomtom/tcomment_vim' " ctrl--でコメントアウトできるように
NeoBundle 'tpope/vim-surround' " csで囲みを変更
NeoBundle 'haya14busa/incsearch.vim' " 便利なインクリメンタルサーチ
NeoBundle 'lilydjwg/colorizer' " colorを表示

" Syntax Highlighter
" NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}} " jsのシンタックス強化
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}} " jsのシンタックス強化
NeoBundle 'othree/yajs.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'tpope/vim-haml'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'

" Tools
NeoBundle 'wakatime/vim-wakatime'

" Color
NeoBundle 'w0ng/vim-hybrid' " テーマ
set t_Co=256

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" NeoBundle Settings End --------------------------------------------------

" options
set number " 行番号の表示
set title " ウィンドウに現在のファイル名を追加
set showmatch " 対応する括弧を強調表示
set tabstop=2 " タブ文字の埋める幅
set smartindent " 次の行のインデントを合わせる
set clipboard+=unnamed " ヤンクの時にクリップボードを使用
set bs=indent,eol,start " backspaceを有効に
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set cursorline " カーソル行の色を変更
set laststatus=2 " ステータス行を常に表示
set cmdheight=2 " メッセージを2行確保
set scrolloff=8 " 上下8行を常に確保
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
set noeol " 最後に空行を禁止
" set cursorcolumn " カーソル位置のカラムの色を変更
" set whichwrap=b,s,h,l,<,>,[,] " 行頭行末移動を有効化
colorscheme hybrid
syntax on

" settings
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
autocmd FileType erb inoremap <silent> <buffer> </ </<C-x><C-o>
" augroup BufferAu " カレントディレクトリを自動的に移動
"   autocmd!
"   autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
" augroup END
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"---------------------------------------------------
"  normal mode
"---------------------------------------------------
noremap <CR> o<ESC> "  ノーマルモードでもEnter改行を有効に
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

"---------------------------------------------------
" insert mode
"---------------------------------------------------
" inoremap <silent> jj <ESC> " jjでノーマルモードへ
" inoremap <silent> hh <ESC>:w<CR> " とりあえず保存振ってみる

"----------------------------------------------------
"  unite.vim
"----------------------------------------------------
noremap <C-p> :Unite file_mru -buffer-name=file_mru -start-insert<CR>
noremap <C-u> :Unite buffer file_rec file/new -start-insert<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer -start-insert<CR> " バッファ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file -start-insert<CR> " ファイル一覧
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
let g:unite_source_rec_max_cache_files = 1000

"----------------------------------------------------
"  neocomplecache
"----------------------------------------------------
let g:acp_enableAtStartup = 0 " AutoComplPopを無効に
let g:neocomplcache_enable_at_startup = 1 " neocomplcacheを有効に
let g:neocomplcache_enable_smart_case = 1 " smartcaseを有効に
let g:neocomplcache_min_syntax_length = 3 " 検索候補表示の最小文字数
let g:neocomplcache_previous_keyword_completion = 1 " つながりを考慮した候補
let g:neocomplcache_enable_camel_case_completion = 1 " camelcaseを単語の区切りとする
let g:neocomplcache_enable_underbar_completion = 1 " underbarを単語の区切りとする
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = { 'default' : '' } " 辞書を定義
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" " タブで変換候補を選択可能に
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\v\h\w*'

"----------------------------------------------------
" Syntax Checker
"----------------------------------------------------
let g:syntastic_javascript_checkers = ['eslint'] " jsxにも対応したjshint
" let g:syntastic_javascript_checkers = ['jsxhint'] " jsxにも対応したjshint
" let g:syntastic_javascript_checker = 'jshint' " JavaScriptはjshintでチェックする - npmでjshintインストールしておくこと
let g:syntastic_check_on_open = 1 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

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
" TODO: 色変更
set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{&ff}]%=\%{g:Date()}C:%03c\ L:%04l/%04L\ %3p%%
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=yellow gui=none ctermfg=black ctermbg=green cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END\%{g:Date()}
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" ステータスラインに日時を表示する
function! g:Date()
    return strftime("%x %H:%M ")
endfunction
