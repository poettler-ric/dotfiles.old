# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    extract
    z
    history
    sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################
# LOAD ADDONS
############################
addons=(
    /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
)
for addon ($addons); do
    if [ -f $addon ]; then
        source $addon
    fi
done

############################
# SETUP ENVIRONMENT
############################
if [[ ! "$PATH" =~ "${HOME}/bin" ]]; then
   export PATH="${HOME}/bin:${PATH}"
fi


############################
# EDITOR SETTINGS
############################
export EDITOR=vi
if type vim >/dev/null; then
	export EDITOR=vim
	alias vi=vim
fi
if type nvim >/dev/null; then
	export EDITOR=nvim
	alias vi=nvim
	alias vim=nvim
fi

############################
# GO SETTINGS
############################

export GOPATH="${HOME}/go"
if [ -d "${GOPATH}/bin" ]; then
    export PATH="${GOPATH}/bin:${PATH}"
fi
goroots=(
    /usr/lib/golang
    /usr/lib/go
)
for root ($goroots); do
    if [ -d $root ]; then
        export GOROOT=$root
    fi
done

############################
# ALIASES AND FUNCTIONS
############################
alias zshconfig="$EDITOR ~/.zshrc"
alias omzshconfig="$EDITOR ~/.oh-my-zsh"

alias :q="exit"
alias b="bc -l"
alias cal='cal -m'
alias clippy='cargo clippy --all-targets --all-features'
alias d="sudo dnf"
alias df="df -h"
alias e="vifm ."
alias s="sudo"
alias v="sudo virsh"
alias vdhcp="sudo virsh net-dhcp-leases default"
alias vs='vi $(fzf)'
alias wttr='curl wttr.in'

alias sync.fedora.local="lftp -c \"open e49141-ftp.services.easyname.eu; set ssl:verify-certificate false; mirror -e fedora.ripo.at $HOME/fedora.ripo.at\""
alias sync.local.fedora="lftp -c \"open e49141-ftp.services.easyname.eu; set ssl:verify-certificate false; mirror -e -R $HOME/fedora.ripo.at fedora.ripo.at\""

alias mount.matlab="sshfs -o idmap=file,uidfile=${HOME}/.sshfs.matlab.uid,gidfile=${HOME}/.sshfs.matlab.gid matlab:/mnt/dfs/ricpoe/home/ricpoe ${HOME}/matlab"
alias umount.matlab='fusermount -u ~/matlab'


mkcd() {
    mkdir -p "$1" && cd "$1" || exit
}
