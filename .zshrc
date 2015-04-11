export LANG=ja_JP.UTF-8

# rbenvを自動読み込み
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alias
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias t='tree'
alias maintenance='sudo kextcache -system-prelinked-kernel'

# options
autoload -U compinit
compinit

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
 
# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }
