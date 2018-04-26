hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "original"

let s:style = &background
let s:palette = {}

" hybrid color
let s:palette.background = { 'dark' : "#1d1f21", 'light' : "#e4e4e4" }
let s:palette.foreground = { 'dark' : "#c5c8c6", 'light' : "#000000" }
let s:palette.selection  = { 'dark' : "#373b41", 'light' : "#bcbcbc" }
let s:palette.line       = { 'dark' : "#282a2e", 'light' : "#d0d0d0" }
let s:palette.comment    = { 'dark' : "#707880", 'light' : "#5f5f5f" }
let s:palette.red        = { 'dark' : "#cc6666", 'light' : "#5f0000" }
let s:palette.orange     = { 'dark' : "#de935f", 'light' : "#875f00" }
let s:palette.yellow     = { 'dark' : "#f0c674", 'light' : "#5f5f00" }
let s:palette.green      = { 'dark' : "#b5bd68", 'light' : "#005f00" }
let s:palette.aqua       = { 'dark' : "#8abeb7", 'light' : "#005f5f" }
let s:palette.blue       = { 'dark' : "#81a2be", 'light' : "#00005f" }
let s:palette.purple     = { 'dark' : "#b294bb", 'light' : "#5f005f" }
let s:palette.window     = { 'dark' : "#303030", 'light' : "#9e9e9e" }
let s:palette.darkcolumn = { 'dark' : "#1c1c1c", 'light' : "#808080" }
let s:palette.addbg      = { 'dark' : "#5F875F", 'light' : "#d7ffd7" }
let s:palette.addfg      = { 'dark' : "#d7ffaf", 'light' : "#005f00" }
let s:palette.changebg   = { 'dark' : "#5F5F87", 'light' : "#d7d7ff" }
let s:palette.changefg   = { 'dark' : "#d7d7ff", 'light' : "#5f005f" }
let s:palette.delbg      = { 'dark' : "#cc6666", 'light' : "#ffd7d7" }
let s:palette.darkblue   = { 'dark' : "#00005f", 'light' : "#d7ffd7" }
let s:palette.darkcyan   = { 'dark' : "#005f5f", 'light' : "#005f00" }
let s:palette.darkred    = { 'dark' : "#5f0000", 'light' : "#d7d7ff" }
let s:palette.darkpurple = { 'dark' : "#5f005f", 'light' : "#5f005f" }

" original color
let s:gray050 = "#fafafa"
let s:gray400 = "#bdbdbd"
let s:gray500 = "#9e9e9e"
let s:gray600 = "#757575"
let s:gray700 = "#616161"
let s:gray800 = "#424242"
let s:gray900 = "#212121"

let s:palette.background = { 'dark': s:gray900, 'light': s:gray050 } " Background
let s:palette.foreground = { 'dark': s:gray050, 'light': s:gray900 } " Foreground, Font
let s:palette.selection  = { 'dark': s:gray700, 'light': s:gray700 } " Current cursor position
let s:palette.line       = { 'dark': s:gray800, 'light': s:gray800 } " Line number, visual model, completion
let s:palette.comment    = { 'dark': s:gray500, 'light': s:gray500 } " Status bar
let s:palette.red        = { 'dark' : "#cc6666", 'light' : "#5f0000" }
let s:palette.orange     = { 'dark' : "#de935f", 'light' : "#875f00" }
let s:palette.yellow     = { 'dark' : "#f0c674", 'light' : "#5f5f00" }
let s:palette.green      = { 'dark' : "#b5bd68", 'light' : "#005f00" }
let s:palette.aqua       = { 'dark' : "#8abeb7", 'light' : "#005f5f" }
let s:palette.blue       = { 'dark' : "#81a2be", 'light' : "#00005f" }
let s:palette.purple     = { 'dark' : "#b294bb", 'light' : "#5f005f" }
let s:palette.window     = { 'dark' : "#303030", 'light' : "#9e9e9e" }
let s:palette.darkcolumn = { 'dark' : "#1c1c1c", 'light' : "#808080" }
let s:palette.addbg      = { 'dark' : "#5F875F", 'light' : "#d7ffd7" }
let s:palette.addfg      = { 'dark' : "#d7ffaf", 'light' : "#005f00" }
let s:palette.changebg   = { 'dark' : "#5F5F87", 'light' : "#d7d7ff" }
let s:palette.changefg   = { 'dark' : "#d7d7ff", 'light' : "#5f005f" }
let s:palette.delbg      = { 'dark' : "#cc6666", 'light' : "#ffd7d7" }
let s:palette.darkblue   = { 'dark' : "#00005f", 'light' : "#d7ffd7" }
let s:palette.darkcyan   = { 'dark' : "#005f5f", 'light' : "#005f00" }
let s:palette.darkred    = { 'dark' : "#5f0000", 'light' : "#d7d7ff" }
let s:palette.darkpurple = { 'dark' : "#5f005f", 'light' : "#5f005f" }

" Formatting Options
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

" Highlighting Primitives
function! s:build_prim(hi_elem, field)
  let l:vname = "s:" . a:hi_elem . "_" . a:field
  let l:gui_assign = "gui".a:hi_elem."=".s:palette[a:field][s:style]
  exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:gui_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
call s:build_prim('bg', 'foreground')
call s:build_prim('bg', 'background')
call s:build_prim('bg', 'selection')
call s:build_prim('bg', 'line')
call s:build_prim('bg', 'comment')
call s:build_prim('bg', 'red')
call s:build_prim('bg', 'orange')
call s:build_prim('bg', 'yellow')
call s:build_prim('bg', 'green')
call s:build_prim('bg', 'aqua')
call s:build_prim('bg', 'blue')
call s:build_prim('bg', 'purple')
call s:build_prim('bg', 'window')
call s:build_prim('bg', 'darkcolumn')
call s:build_prim('bg', 'addbg')
call s:build_prim('bg', 'addfg')
call s:build_prim('bg', 'changebg')
call s:build_prim('bg', 'changefg')
call s:build_prim('bg', 'delbg')
call s:build_prim('bg', 'darkblue')
call s:build_prim('bg', 'darkcyan')
call s:build_prim('bg', 'darkred')
call s:build_prim('bg', 'darkpurple')

let s:fg_none = ' guifg=NONE ctermfg=NONE'
call s:build_prim('fg', 'foreground')
call s:build_prim('fg', 'background')
call s:build_prim('fg', 'selection')
call s:build_prim('fg', 'line')
call s:build_prim('fg', 'comment')
call s:build_prim('fg', 'red')
call s:build_prim('fg', 'orange')
call s:build_prim('fg', 'yellow')
call s:build_prim('fg', 'green')
call s:build_prim('fg', 'aqua')
call s:build_prim('fg', 'blue')
call s:build_prim('fg', 'purple')
call s:build_prim('fg', 'window')
call s:build_prim('fg', 'darkcolumn')
call s:build_prim('fg', 'addbg')
call s:build_prim('fg', 'addfg')
call s:build_prim('fg', 'changebg')
call s:build_prim('fg', 'changefg')
call s:build_prim('fg', 'darkblue')
call s:build_prim('fg', 'darkcyan')
call s:build_prim('fg', 'darkred')
call s:build_prim('fg', 'darkpurple')

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

exe "let s:sp_none       = ' guisp=". s:none                            ."'"
exe "let s:sp_foreground = ' guisp=". s:palette.foreground[s:style] ."'"
exe "let s:sp_background = ' guisp=". s:palette.background[s:style] ."'"
exe "let s:sp_selection  = ' guisp=". s:palette.selection[s:style]  ."'"
exe "let s:sp_line       = ' guisp=". s:palette.line[s:style]       ."'"
exe "let s:sp_comment    = ' guisp=". s:palette.comment[s:style]    ."'"
exe "let s:sp_red        = ' guisp=". s:palette.red[s:style]        ."'"
exe "let s:sp_orange     = ' guisp=". s:palette.orange[s:style]     ."'"
exe "let s:sp_yellow     = ' guisp=". s:palette.yellow[s:style]     ."'"
exe "let s:sp_green      = ' guisp=". s:palette.green[s:style]      ."'"
exe "let s:sp_aqua       = ' guisp=". s:palette.aqua[s:style]       ."'"
exe "let s:sp_blue       = ' guisp=". s:palette.blue[s:style]       ."'"
exe "let s:sp_purple     = ' guisp=". s:palette.purple[s:style]     ."'"
exe "let s:sp_window     = ' guisp=". s:palette.window[s:style]     ."'"
exe "let s:sp_addbg      = ' guisp=". s:palette.addbg[s:style]      ."'"
exe "let s:sp_addfg      = ' guisp=". s:palette.addfg[s:style]      ."'"
exe "let s:sp_changebg   = ' guisp=". s:palette.changebg[s:style]   ."'"
exe "let s:sp_changefg   = ' guisp=". s:palette.changefg[s:style]   ."'"
exe "let s:sp_darkblue   = ' guisp=". s:palette.darkblue[s:style]   ."'"
exe "let s:sp_darkcyan   = ' guisp=". s:palette.darkcyan[s:style]   ."'"
exe "let s:sp_darkred    = ' guisp=". s:palette.darkred[s:style]    ."'"
exe "let s:sp_darkpurple = ' guisp=". s:palette.darkpurple[s:style] ."'"

" Vim Highlighting
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_delbg       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue    .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
exe "hi! Title"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
hi LongLineWarning guifg=NONE guibg=#371F1C gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

" Use defined custom background colour for terminal Vim.
if !has('gui_running') && exists("g:original_custom_term_colors") && g:original_custom_term_colors == 1
  let s:bg_normal = s:bg_none
else
  let s:bg_normal = s:bg_background
endif
exe "hi! Normal"        .s:fg_foreground  .s:bg_normal      .s:fmt_none

" Generic Syntax Highlighting
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none
exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Operator"        .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! PreProc"         .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Type"            .s:fg_orange      .s:bg_none        .s:fmt_none
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Special"         .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
hi! link diffRemoved Constant
hi! link diffAdded Special
