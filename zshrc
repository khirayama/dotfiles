export LANG="${LANG:-ja_JP.UTF-8}"

# Homebrew
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

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

# Node version manager (fnm)
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

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
if [[ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
  export PATH="$JAVA_HOME/bin:$PATH"
fi
export ANDROID_HOME="$HOME/Library/Android/sdk"
if [[ -d "$ANDROID_HOME" ]]; then
  export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin"
fi

# iOS Dev
if [[ -d "/Applications/Xcode.app/Contents/Developer" ]]; then
  export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
fi
if [[ -d "$HOME/.lmstudio/bin" ]]; then
  export PATH="$PATH:$HOME/.lmstudio/bin"
fi
