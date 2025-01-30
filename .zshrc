
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="customagnoster"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
    zsh-vi-mode 
    fzf
    git 
    zsh-autosuggestions 
    history-substring-search
)

function zvm_config() {
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
    ZVM_REPLACE_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

. /usr/share/z/z.sh

source $ZSH/oh-my-zsh.sh
# source /usr/share/nvm/init-nvm.sh

TERM=xterm-256color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
VIRTUAL_ENV_DISABLE_PROMPT=1
export EDITOR=helix
export TERMINAL=kitty
export SUDO_EDITOR=helix
export VISUAL=helix
export BAT_THEME=hexsteel
# export XDG_RUNTIME_DIR=/run/user/$(id -u)
# export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

alias py="python"
alias hx="helix"
alias uiologin="ssh -YC bragewi@login.ifi.uio.no"
alias uiofolder="sshfs bragewi@login.ifi.uio.no: /home/brage/IFI -o reconnect,modules=iconv,from_code=utf8"
alias neofetch="neofetch --ascii ~/Documents/asciiart/skull.txt --ascii_colors 7"

pyactivate() {
    source ~/.pyenvs/$1/bin/activate
}
mlnodeslogin() {
    ssh -J bragewi@gothmog.uio.no bragewi@"$1".hpc.uio.no
}
mlnodesfile() {
    scp -J bragewi@login.uio.no "$1" bragewi@ml1.hpc.uio.no:
}

# alias lf="~/.config/lf/lfrun"
lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

set -o vi
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/brage/.zshrc'

autoload -Uz compinit
compinit
