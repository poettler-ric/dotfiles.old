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
fi

# rust settings
export PATH="${HOME}/.cargo/bin:${PATH}"

# python helper library
export PYTHONPATH=~/pylib

# history settings
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="ls:history"

###############
# aliases
###############

alias b="bc -l"
alias d="sudo dnf"
alias e="vifm ."
alias s=sudo
alias v="sudo virsh"
alias python=python3
alias vs='vi $(fzf)'
alias wttr='curl wttr.in'
alias clippy='cargo clippy --all-targets --all-features'
alias grep=rg
alias cal='cal -m'

alias sync.fedora.local="lftp -c \"open e49141-ftp.services.easyname.eu; set ssl:verify-certificate false; mirror -e fedora.ripo.at $HOME/fedora.ripo.at\""
alias sync.local.fedora="lftp -c \"open e49141-ftp.services.easyname.eu; set ssl:verify-certificate false; mirror -e -R $HOME/fedora.ripo.at fedora.ripo.at\""

alias sync.local.infobw="lftp -c \"open e49141-ftp.services.easyname.eu; set ssl:verify-certificate false; mirror -e -R $HOME/infobw.ripo.at/public infobw.ripo.at\""

if [ -n "$(which nvim 2>/dev/null)" ]
then
	alias vi=nvim
	alias vim=nvim
fi

alias mount.matlab="sshfs -o idmap=file,uidfile=${HOME}/.sshfs.matlab.uid,gidfile=${HOME}/.sshfs.matlab.gid matlab:/mnt/dfs/ricpoe/home/ricpoe ${HOME}/matlab"
alias umount.matlab='fusermount -u ~/matlab'

alias getrpmsources='spectool -g -R'

###############
# shfunctions
###############

ssh_rekey() {
    ssh-keygen -R "$1"
    ssh -o StrictHostKeyChecking=no "$1"
}

lvresize_xfs() {
    if [ $# -lt 2 ]
    then
        echo "usage: $0 <size> <device> [args]"
        return 1
    fi

    size=$1
    device=$2

    shift 2

    sudo lvresize -L "$size" "$@" "$device"
    sudo xfs_growfs "$device"
}

lskernel() {
    sudo dnf list installed | grep kernel.x86_64
}

rmkernel() {
    sudo dnf remove \
        "kernel-$1" \
        "kernel-core-$1" \
        "kernel-devel-$1" \
        "kernel-modules-$1" \
        "kernel-modules-extra-$1"
}

mkcd() {
    mkdir -p "$1" && cd "$1" || exit
}

