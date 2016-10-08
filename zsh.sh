#!/usr/sh

# Insall Oh My Zsh
if [ ! -e $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install zsh-syntax-highlighting
ZSH_SYNTAX_DIR=$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
if [ ! -e $ZSH_SYNTAX_DIR ]; then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_SYNTAX_DIR
fi
