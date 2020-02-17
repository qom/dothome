#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable git completion and show branch name in bash prompt
if [ -d /usr/share/git/completion/ ];then
    . /usr/share/git/completion/git-completion.bash
    . /usr/share/git/completion/git-prompt.sh
fi

# Add to PATH variable
PATH=$PATH:$HOME/scripts

# Address VTE specific issues (Tilix uses VTE): https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Shell prompt format. Show git branch info.
PS1="[\u@\h \e[38;5;178m\W\e[38;5;71m\$(__git_ps1 '(%s)')\e[39m]\$ "

# Basic prompt
# PS1='[\u@\h \W]\$ '

# Start fasd (quick access to recent files and directories)
# eval "$(fasd --init auto)"

#
# aliases 
#

alias ls='ls --color=auto'

# Reset resolution (usually after quitting citrix app)
alias reset_res='xrandr --output eDP1 --scale 1x1'

# git alias from:  https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dothome/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
