# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/moveek/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# qom config
autoload -U promptinit
promptinit
prompt adam2

alias ls='ls --color=auto'
alias pacman='pacman-color'

