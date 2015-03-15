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
NeoBundle 'Shougo/unite.vim' " なんか便利らしい
NeoBundle 'Shougo/neocomplcache' " 入力補完
NeoBundle 'Shougo/vimproc.vim', {'build' : {'windows' : 'tools\\update-dll-mingw', 'cygwin' : 'make -f make_cygwin.mak', 'mac' : 'make -f make_mac.mak', 'linux' : 'make', 'unix' : 'gmake', },}
NeoBundle 'Shougo/neosnippet' " snippet補完
NeoBundle 'Shougo/neosnippet-snippets' " neosnippet用snippets集
NeoBundle 'scrooloose/syntastic' " 構文チェック
NeoBundle 'scrooloose/nerdtree' " 便利なファイルアクセス  
NeoBundle 'Townk/vim-autoclose' " 括弧等の自動補完
NeoBundle 'mattn/emmet-vim' " vim用emmet
NeoBundle 'w0ng/vim-hybrid' " テーマ
" Syntax Highlighter
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'tpope/vim-haml'

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
" set cursorcolumn " カーソル位置のカラムの色を変更
" set whichwrap=b,s,h,l,<,>,[,] " 行頭行末移動を有効化
colorscheme hybrid
syntax on

"---------------------------------------------------
"  normal mode
"---------------------------------------------------
noremap <CR> o<ESC>

"---------------------------------------------------
" insert mode
"---------------------------------------------------
inoremap <silent> jj <ESC> " jjでノーマルモードへ

"----------------------------------------------------
"  unite.vim
"----------------------------------------------------
noremap <C-p> :Unite file_mru -buffer-name=file_mru -start-insert<CR>
noremap <C-u> :Unite buffer file_rec -start-insert<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer -start-insert<CR> " バッファ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file -start-insert<CR> " ファイル一覧
let g:unite_source_rec_max_cache_files = 1000

"----------------------------------------------------
"  complecache
"----------------------------------------------------
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.
let g:neocomplcache_enable_smart_case = 1 " Use smartcase.
let g:neocomplcache_min_syntax_length = 3 " Set minimum syntax keyword length.
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = { 'default' : '' } " Define dictionary.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"----------------------------------------------------
" Syntax Checker
"----------------------------------------------------
let g:syntastic_javascript_checker = "jshint" " JavaScriptはjshintでチェックする
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施

