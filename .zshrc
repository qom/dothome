# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/moveek/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

#####################################################

# For autojump
source /etc/profile

autoload -U compinit promptinit
compinit
promptinit
prompt adam2

autoload -U colors && colors
# PS1="%{$fg[green]%}[%n@%m %~]%%%{$reset_color%} "

zstyle ':completion:*' menu select

# autocompletion of command line switches for aliases
setopt completealiases
alias ls='ls --color=auto -F'

# CTRL-R history search while keeping vi mode bindings
# courtesty of: https://bbs.archlinux.org/viewtopic.php?id=52173
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# Use notify-send to alert that something finished
alias nd='notify-send "DONE"'

# Sync ranger path with shell
source /usr/share/doc/ranger/examples/bash_automatic_cd.sh

# Set default name of vim server
export TARGETVIM=GVIM

# Define a ranger-cd ZSH widget. This widget can be used to assign
# a keyboard shortcut for launching ranger-cd using "bindkey"
# Not quite working: http://unix.stackexchange.com/questions/79897/how-can-i-use-bindkey-to-run-a-script
ranger-cd_widget() ranger-cd
zle -N ranger-cd_widget
bindkey '^o' ranger-cd
