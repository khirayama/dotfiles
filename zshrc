export LANG=ja_JP.UTF-8

# direnv
eval "$(direnv hook zsh)"

# 起動時tmuxを起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# yarnのpathを通す
if [ -d $HOME/.yarn ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

# go開発環境 - goenv
export GOROOT="/usr/local/go"
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
if [ -d $HOME/.goenv ]; then
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"
fi

# python開発環境 - pyenv
if [ -d $HOME/.pyenv ]; then
  export PATH="$HOME/.pyenv/shims:$PATH"
fi

# ruby開発環境 - rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# node開発環境 - nodebrew
if [ -d $HOME/.nodebrew ]; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# Android dev env
if [ -d /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home ]; then
  export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
fi

# Add diff-highlight path
if [ -d /user/local/share/git-core/contrib/diff-highlight ]; then
  export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
fi

# tabで補完するとき、大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# alias
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
alias yi='yarn install'
alias ya='yarn add'
alias ys='yarn start'
alias yt='yarn test'
alias yr='yarn run'

# ----------------------
# Rails Aliases
# ----------------------
alias be='bundle exec'
alias bers='bundle exec rails s'
alias bersp='bundle exec rails s -p'

# ----------------------
# Git Aliases
# ----------------------
if [ -x "`which hub`" ]; then
  alias git='hub'
  alias gbi='git browse -- issues'
  alias gbp='git browse -- pulls'
  alias gpr='git pull-request'
fi
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias grm='git rm $(git ls-files --deleted)'
alias gg='git grep -n -i'
alias gge='git grep -n -i -e'
alias grp='git remote prune'
alias gbd='git branch --merged | grep -v "*" | xargs -I % git branch -d %'

# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '%s][* %F{yellow}%b%f'
precmd() { vcs_info }
PROMPT='[${vcs_info_msg_0_}]:%~/%f '
