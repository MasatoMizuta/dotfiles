###############################################################################
# Oh My Zsh                                                                   #
###############################################################################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx zsh-syntax-highlighting docker kubectl vagrant npm pod redis-cli golang)

source $ZSH/oh-my-zsh.sh

###############################################################################
# User configuration                                                          #
###############################################################################

# Set PATH
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:/usr/local/sbin:/usr/local/opt/openssl/bin:$PATH"

# Peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# Alias
alias docker-for-minikube='eval $(minikube docker-env)'
alias docker-for-local='eval $(minikube docker-env -u)'

# ZSH option
unsetopt auto_cd
setopt hist_ignore_all_dups

# Google Cloud SDK completion
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
