## Debian/Ubuntu

```
# Set up ssh for github. https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# cat ~/.ssh/id_rsa.pub
# Register id_rsa.pub on github
# ssh -T git@github.com

$ git clone git@github.com:khirayama/dotfiles.git

$ sh ./setup.debian.sh

# Change default shell to `/usr/bin/zsh` from `bash`
$ sudo vim /etc/passwd

$ sudo shutdown -r now
```

## Settings & Install

- Google Chrome https://www.google.com/intl/ja_jp/chrome/
- Hyper Term https://hyper.is/
- Settings
  - 外観
    - ウインドウの色: 暗い
    - Dockを自動的に隠す: On
    - アイコンサイズ: 32
    - 表示位置: 下
  - 通知
    - 全てOff
  - ディスプレイ
    - 夜間モード: 常時On
  - マウスとタッチパッド
    - タッチパッドの速度を調整
  - キーボードショートカット
    - Off
      - 端末の起動
      - ウィンドウメニューを開く
      - 画面をロック
    - 変更
      - 検索: Alt+Up
      - 前の入力ソースへ切り替える: Shift+Ctrl+Space
      - 次の入力ソースへ切り替える: Ctrl+Space
    - 追加
      - Albertの起動: Super+Space
      - Albertの起動: Alt+Space
   - ユーザー
    - 自動ログイン: Off

## Troubleshooting

- Chromeの起動時に認証を求められる
  - 自動ログインを切ればよい
  - [Chromeブラウザ起動時に「ログインのキーリングのパスワードを入力してください」を回避する方法 - タイを釣りたいエビ](https://ebiss.hatenablog.com/entry/2019/02/10/200000)
- key remapしたい
  - xmodmapを使う
  - xevでkeycodeは調べられる
  - autostartの方法は調査中
  - ~/.config/autostartだと動かず。/etc/xdg/autostartも同様
  - ~/.Xmodmap, ~/.xinitrc, ~/.xsessionrcも動かず
  - https://itectec.com/ubuntu/ubuntu-how-to-set-xmodmap-on-login/
  - Adding delayで解決
- Mozcの初期値をかなにしたい
  - [mozcのデフォルトをひらがな入力モードにする - dakusui's blog](http://dakusui.hatenablog.com/entry/2017/09/24/160400)
  - 現状、buildしたりが必要でめんどい。のでしてない
