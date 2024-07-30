
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


source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh


# User configuration

TERM=xterm-256color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
# export MANPATH="/usr/local/man:$MANPATH"
#
export EDITOR='nvim'
export VISUAL='nvim'



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
alias uiologin="ssh -YC bragewi@login.ifi.uio.no"
alias uiofolder="sshfs bragewi@login.ifi.uio.no: /home/brage/IFI -o reconnect,modules=iconv,from_code=utf8"
alias framerate="xrandr --output eDP-1 --mode 2560x1440 --rate"
alias texinit="cp ~/Templates/init.tex ."
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
# # End of lines configured by zsh-newuser-install
# # The following lines were added by compinstall
zstyle :compinstall filename '/home/brage/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
