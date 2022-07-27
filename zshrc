# export LANG=ja_JP.UTF-8
# export LC_CTYPE=ja_JP.UTF-8
# export TERM=xterm-256color
eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# go dev env - goenv
# export GOROOT="/usr/local/opt/go/libexec"
# export GOPATH=$HOME/.go
# export PATH=$PATH:$GOPATH/bin
# if [ -d $HOME/.goenv ]; then
#   export GOENV_ROOT=$HOME/.goenv
#   export PATH=$GOENV_ROOT/bin:$PATH
#   eval "$(goenv init -)"
# fi

# python dev env - pyenv
if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$HOME/.pyenv/shims:$PATH"
  eval "$(pyenv init -)"
fi

# ruby dev env - rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# node dev env - nvm
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Add diff-highlight path
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# tabで補完するとき、大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# alias
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias t='tree'
alias v='vim'
alias update='
  brew update &&
  echo "done: brew update" &&
  brew upgrade &&
  echo "done: brew upgrade" &&
  brew cleanup -s &&
  echo "done: brew cleanup" &&
  brew install $(brew list --cask) &&
  echo "done: brew cask update" &&
  (brew outdated --cask | xargs brew uninstall $1) &&
  echo "done: brew cask cleanup"
'
alias dump='
  brew update &&
  rm Brewfile &&
  brew bundle dump
'
alias maintenance='
  sudo kextcache -system-prelinked-kernel &&
  sudo kextcache -system-caches &&
  sudo killall Dock &&
  sudo chmod -R -N ~ &&
  sudo update_dyld_shared_cache -force &&
  sudo purge
'
alias vpn='open /Applications/Pulse\ Secure.app/Contents/Plugins/JamUI/PulseTray.app'
alias simulator='open -a Simulator'
alias vnc='vnc -kill -f :1 & vncserver -localhost no -FrameRate 120 -geometry 1920x1200 :1'

# sudo diskutil repairPermissions / &&

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
alias ni='npm i'
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

# Android dev env
export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home:/Library/Java/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter
export PATH=$PATH:~/Works/flutter/bin

# Ubuntu
# https://qiita.com/Morichan/items/62ccf58c8f292549ce36
alias ngrok-ssh='nohup ngrok tcp 22 &'

bindkey '^M' accept-line
bindkey '^[OM' accept-line

case ${OSTYPE} in
    linux*)
        alias open='xdg-open'
        ;;
esac
