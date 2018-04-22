#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias aura="sudo aura"
# Enable git completion and show branch name in bash prompt
if [ -d /usr/share/git/completion/ ];then
	. /usr/share/git/completion/git-completion.bash
	. /usr/share/git/completion/git-prompt.sh
fi

alias ls='ls --color=auto'
PS1="\[[\u@\h \e[38;5;178m\W\e[38;5;71m\$(__git_ps1 '(%s)')\e[39m]\$\] "

export PATH=$PATH:$HOME/scripts

# Set vim as editor of choice for git and other applications
export VISUAL=vim
export EDITOR="$VISUAL"

# If this is an xterm set the title to user@host:dir
# From: https://mg.pov.lt/blog/bash-prompt.html 
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

    # Show the currently running command in the terminal title:
    # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                # The command is trying to set the title bar as well;
                # this is most likely the execution of $PROMPT_COMMAND.
                # In any case nested escapes confuse the terminal, so don't
                # output them.
                ;;
            *)
                #echo -ne "\033]0;${USER}@${HOSTNAME}: ${BASH_COMMAND}\007"
                echo -ne "\033]0;xterm: ${BASH_COMMAND}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac
