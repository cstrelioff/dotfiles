##
## Christopher C. Strelioff
## 2016 MIT LICENSE
##
## 2021, Aug: Ubuntu 20.04LTS
## 2016, Sep: Ubuntu 16.04LTS
## 2016, July: Ubuntu 14.04LTS
##

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##
## additions
##

## custom prompt
#PS1='\u@\h:[\W]\\$ '
#PS1='\n\[\w\]\n\u@\h \$ '
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '


## PATH
# include .local/bin for local python scripts
export PATH=~/.local/bin:$PATH
# include /opt/texbin in our path
export PATH=~/opt/texbin:$PATH
# for global installs by node via npm without sudo
export PATH=~/.npm-global/bin:$PATH

# n -- for nodejs version management
export N_PREFIX=$HOME/n
export PATH="$HOME/n/bin:$PATH"
 
## editor
export VISUAL=vim
export EDITOR="$VISUAL"

## GIT
# source: http://pastebin.com/K8TjJyjD#
alias gitlog='git log --graph --date-order -C -M --pretty=format:"%C(yellow)%h%C(reset) - %C(bold green)%ad%C(reset) - %C(dim yellow)%an%C(reset) %C(bold red)>%C(reset) %C(white)%s%C(reset) %C(bold red)%d%C(reset) " --abbrev-commit --date=short'

## virtualenvwrapper setup
# where to store our virtual envs
export WORKON_HOME=$HOME/virtenvs
# where projects will reside
export PROJECT_HOME=$HOME/Projects-Active
# new setting for Python 3 on Ubunut 20.04
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# where is the virtualenvwrapper.sh
source $HOME/.local/bin/virtualenvwrapper.sh

## tmux
alias tmux='tmux -2'  # ensure 256 colors for tmux and vim
eval "$(_TMUXP_COMPLETE=source tmuxp)" # tab-complete for tmuxp

## color support
if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi




