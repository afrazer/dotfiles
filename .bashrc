# .bashrc

# Remove this to "uninstall" powerline
# . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# Change the prompt to something that I like
# Replace 0 with 1 for dark color
# Black 0;30 - Blue 0;34 - Green 0;32 - Cyan 0;36 - Red 0;31
# Purple 0;35 - Brown 0;33
#PS1='\[\e[36m\]\u@\h \W $ \[\e[0m\]'
green=$(tput setaf 2)
reset=$(tput sgr0)
# PS1='\[$green\]\u@\h \W $ \[$reset\]'
PS1='[\[$green\]\u@\h \w$(__git_ps1 " (%s)")\[$reset\]] \n\$ '
export PS1

export EDITOR=vim

if [ -z "$HISTTIMEFORMAT" ]; then
    export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S %z "
fi

set -o vi

set show-mode-in-prompt on

shopt -s histverify

# cd to directory just by typing it
shopt -s autocd

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Sets the Mail Environment variable
MAIL=/var/spool/mail/alex
export MAIL

# Enable opam
# eval `opam config env`

# Functions
# Stand-in for cd, changes to $argument and then ls's the new directory
# Example:
# $ cs foo/bar
function cs() {
    cd "$1"
    ls
}

# Move up $argument directories
# Example:
# $ up 5
function up() {
    for i in $(seq 1 $1)
    do
        cd ..
    done
}

function duh {
    local dir=$1

    du -shc $dir
}

function huh() {
    local huh=$1
    if [[ -z ${huh} ]]; then
        huh=10
    fi

    history | tail -n ${huh}
}

function psa() {
    ps -F -u $1 --forest
}

function work-on() {
    local env=$1
    if [ "$env" = "conda" ]; then
        source ~/.bashrc.conda
    fi
}

