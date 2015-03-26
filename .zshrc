export LANG=ja_JP.UTF-8
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alias
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

# options
autoload -U compinit
compinit

export EDITOR=vim
autoload -Uz colors; colors
setopt nobeep
setopt prompt_subst

autoload colors
colors
PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%} 
 [%n]$ "

 PROMPT2='[%n]> ' 
