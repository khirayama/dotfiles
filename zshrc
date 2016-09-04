export LANG=ja_JP.UTF-8

eval "$(direnv hook zsh)"

# 起動時tmuxを起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# ruby開発環境/rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# node開発環境/nodebrew
if [ -d $HOME/.nodebrew ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# golang開発環境
export PATH=$PATH:/usr/local/go/bin
export GOROOT="/usr/local/go"
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin

# tabで補完するとき、大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# alias
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias t='tree'
alias v='vim'
alias maintenance='
  sudo kextcache -system-prelinked-kernel &&
  sudo kextcache -system-caches &&
  sudo killall Dock &&
  sudo chmod -R -N ~ &&
  sudo update_dyld_shared_cache -force &&
  sudo diskutil repairPermissions / &&
  sudo purge
'
alias server='python -m SimpleHTTPServer'
alias chrome='open "/Applications/Google Chrome.app/" --args --renderer-process-limit=1'
alias chromecanary='open "/Applications/Google Chrome Canary.app/" --args --renderer-process-limit=1'

# options
autoload -U compinit
compinit -u

export EDITOR=vim
autoload -Uz colors; colors
setopt auto_cd
setopt nobeep
setopt prompt_subst

autoload colors
colors
PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%}
 [%n]$ "

 PROMPT2='[%n]> '

# ----------------------
# Node Aliases
# ----------------------
alias ni='sudo npm i'
alias ns='npm start'
alias nt='npm test'
alias nr='npm run'

# ----------------------
# Rails Aliases
# ----------------------
alias be='bundle exec'
alias bers='bundle exec rails s'
alias bersp='bundle exec rails s -p'

# ----------------------
# Git Aliases
# ----------------------
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias grm='git rm $(git ls-files --deleted)'
alias gg='git grep -n -i'
alias gge='git grep -n -i -e'
alias grp='git remote prune'

# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '%s][* %F{yellow}%b%f'
precmd() { vcs_info }
PROMPT='[${vcs_info_msg_0_}]:%~/%f '
