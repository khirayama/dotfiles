# export TERM=xterm-256color
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
eval "$(/opt/homebrew/bin/brew shellenv)"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # tabで補完するとき、大文字小文字を区別しない
autoload -U compinit
compinit -u

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '%s][* %F{yellow}%b%f'
precmd() { vcs_info }
PROMPT='[${vcs_info_msg_0_}]:%~/%f '

export EDITOR=nvim
autoload -Uz colors; colors
setopt auto_cd
setopt nobeep
setopt prompt_subst

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH=$PATH:/opt/homebrew/share/git-core/contrib/diff-highlight

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias t='tree'
alias v='nvim'
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

alias maintenance='
  sudo diskutil verifyDisk disk0 &&
  sudo diskutil repairDisk disk0 &&
  sudo purge &&
  sudo fstrim -v / &&
  sudo softwareupdate -l &&
  sudo softwareupdate -ia
'
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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

. "$HOME/.local/bin/env"
alias claude="$HOME/.claude/local/claude"
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
