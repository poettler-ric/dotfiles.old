# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. ~/dotfiles/aliases
. ~/dotfiles/shfunctions

# bash vi mode
set -o vi

# vim settings
export EDITOR=vi
if [ -n "$(which nvim 2>/dev/null)" ]
then
	export EDITOR=nvim
fi

# go settings
if [ -d "${HOME}/go" ]
then
    export GOPATH="${HOME}/go"
    export PATH="${GOPATH}/bin:${PATH}"

    for d in ${GOPATH}/src/*
    do
        export CDPATH="${CDPATH}:${d}"
    done
fi

# python helper library
export PYTHONPATH=~/pylib
