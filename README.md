# Setup

## Setting up

- Install Xcode from AppStore
- Install Homebrew
  - https://brew.sh/index_ja
  - `brew bundle`
- Run `setup.sh`
  - Install HomeBrew. Then install packages and setup config files.
- Set up GitHub
  - https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

## Mac Preferences

- General
  - Choose Dark Theme
- Dock
  - Enable "Automatically hide and show the Dock"
  - Disable "Show indicators for open applications"
  - Disable "Show recent applications in Dock"
- Keyboard
  - Key Repeat to Fast
  - Delay Until Repeat to Short
  - "Modifier Keys" > Caps Lock to Control
  - "Modifier Keys" > Global to Control
  - Input Source > Add Japanese and disable カタカタ
  - Input Source > Disable Live Conversion
- Trackpad
  - Disable "Look up & data detectors"
  - Enable "Tap to click"
  - "More Gestures" > Disable "Notification Center"
- Display
  - Disbale "Automatically adjust brightness"
  - "Night Shift" 4:00 to 3:59 and "More Warm"
- Disable screen saver if you want
  - Create autometor application with `caffeinate -d -i -u -s &` as shell running
  - Add the app to Login Item

## Dump

Run `dump.sh`

## Install

### Memo

- Tried to use Terminal.app, but the response is really slow after High Sierra
- [iTerm2で外せないショートカットキー一覧](https://qiita.com/kenju/items/3bcd9707266a0b427da3)
- [screenのコマンドの備忘録](https://qiita.com/mgoldchild/items/e336618487eb7d90f6d4)
- [ターミナルをかっこよくカスタマイズしたいためだけにtmuxデビューしてみた](https://qiita.com/Frog_woman/items/f6797f2a70c44e42863d#%E7%AF%84%E5%9B%B2%E6%8C%87%E5%AE%9A%E3%81%8C%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84)
- [tmux](https://wiki.archlinux.jp/index.php/Tmux#Vim_.E3.83.95.E3.83.AC.E3.83.B3.E3.83.89.E3.83.AA.E3.81.AA.E8.A8.AD.E5.AE.9A)
- [Colours in terminal](https://gist.github.com/XVilka/8346728#now-supporting-truecolour)
- [ターミナル環境 (iTerm, vim, tmux) をフルカラーで使う](https://blog.nakanishy.com/truecolor-vim.html)

#### Vim

- +: 次の行の先頭
- -: 前の行の先頭
- C-i: ジャンプしてきた箇所に進む
- C-o: ジャンプしてきた箇所に戻る
- w: word 単語移動
- b: word back 単語移動バック
- ^: 先頭
- $: 行末
- f: 検索（;: 次へ）
- %: 対応する括弧
- /s: 行内置換
- /%s: ファイル内置換
- C-n: 補完
- -p: タブで開く
- -O: 垂直分割で開く

- [map - Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/map.html)
- [Vim で使える Ctrl を使うキーバインドまとめ - 反省はしても後悔はしない](http://cohama.hateblo.jp/entry/20121023/1351003586)
