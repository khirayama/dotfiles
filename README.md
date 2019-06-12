# Setup

- setup github: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
- clone: https://github.com/khirayama/dotfiles

## Styling

- Font: https://www.google.com/get/noto/#/
- Color: https://material.io/guidelines/style/color.html#color-color-palette

## Basic settings

- xcode
- Chrome

## Dump

```
$ brew bundle dump
```

## Restore

```
$ brew bundle
$ sh ./dotfilesLink.sh

// for zsh
$ vi /etc/shells // add /usr/local/bin/zsh
$ chsh -s /usr/local/bin/zsh

// for vim
$ sh ./installer.sh ~/.cache/dein
```

## Install

### Standalone

- f.lux: https://justgetflux.com/
- vscode: https://code.visualstudio.com/
- sketch: https://www.sketchapp.com/

### Memo

- Tried to use Terminal.app, but the response is really slow after High Sierra
- [iTerm2で外せないショートカットキー一覧](https://qiita.com/kenju/items/3bcd9707266a0b427da3)
- [screenのコマンドの備忘録](https://qiita.com/mgoldchild/items/e336618487eb7d90f6d4)
- [ターミナルをかっこよくカスタマイズしたいためだけにtmuxデビューしてみた](https://qiita.com/Frog_woman/items/f6797f2a70c44e42863d#%E7%AF%84%E5%9B%B2%E6%8C%87%E5%AE%9A%E3%81%8C%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84)
- [tmux](https://wiki.archlinux.jp/index.php/Tmux#Vim_.E3.83.95.E3.83.AC.E3.83.B3.E3.83.89.E3.83.AA.E3.81.AA.E8.A8.AD.E5.AE.9A)
- [Colours in terminal](https://gist.github.com/XVilka/8346728#now-supporting-truecolour)
- [ターミナル環境 (iTerm, vim, tmux) をフルカラーで使う](https://blog.nakanishy.com/truecolor-vim.html)

#### Vim

- w: word 単語移動
- b: word back 単語移動バック
- ^: 先頭
- $: 行末
- f: 検索（;: 次へ）
- %: 対応する括弧
- /s: 行内置換
- /%s: ファイル内置換
- -p: タブで開く
- -O: 垂直分割で開く
- ctrl + n: 補完

#### Visual Studio Code

$HOME/Library/Application Support/Code/User/settings.json

- [ ] タブのようにwindowを作る
- [ ] editorで:eのときにtabで補完
- [ ] color scheme
- [x] hotkeyの設定 - むりぽ
- [x] whichwrap vimの移動で改行をまたぐ - むりぽ
- [x] quickOpen時に全ファイル表示 - たぶんExplorer使うのがいいっぽい？
