# Setup

- setup github: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
- clone: https://github.com/khirayama/dotfiles

## Styling

- Font: https://www.google.com/get/noto/#/
- Color: https://material.io/guidelines/style/color.html#color-color-palette

## Basic settings

- xcode
- chrome
- iterm2: https://www.iterm2.com/
  - link com.googlecode.iterm2.plist
- homebrew: http://brew.sh/
- zsh via brew

## Commands

```
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
- nodebrew: https://github.com/hokaccha/nodebrew
- sketch: https://www.sketchapp.com/

### Homebrew

- zsh
- direnv
- vim --with-lua
- git
- hub
- tree
- pyenv
- rbenv

### Other

- yarn via npm
- bundler via gem

### Memo

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
