export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# Homebrew (Apple Silicon, hardcoded)
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '%s][* %F{yellow}%b%f'
precmd() { vcs_info }
PROMPT='[${vcs_info_msg_0_}]:%~/%f '

export EDITOR=vim
setopt auto_cd
setopt nobeep

export PATH="$HOME/.local/bin:/opt/homebrew/share/git-core/contrib/diff-highlight:$PATH"

[[ -z "$TMUX" && -n "$PS1" ]] && tmux

# Node version manager (fnm)
eval "$(fnm env --use-on-cd --shell zsh)"

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias t='tree'
alias v='vim'
alias update='brew update && brew upgrade && brew cleanup -s'
alias dump='brew update && rm Brewfile && brew bundle dump'

alias ni='npm install'
alias ns='npm start'
alias nt='npm test'
alias nr='npm run'

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
alias cop='copilot --allow-all'

# Java for Android/Gradle
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin"

# iOS Dev
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
