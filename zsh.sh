#!/usr/sh

# Insall Oh My Zsh
ZSH=~/.oh-my-zsh
if [ ! -e $ZSH ]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

# Install zsh-syntax-highlighting
ZSH_SYNTAX=$ZSH/custom/plugins/zsh-syntax-highlighting
if [ ! -e $ZSH_SYNTAX ]; then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_SYNTAX
fi

# Change login shell to zsh
ZSH_PATH=/usr/local/bin/zsh
if [ $SHELL != $ZSH_PATH ]; then
    echo 'Change login shell to zsh'
    grep -q $ZSH_PATH /etc/shells || echo $ZSH_PATH | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/zsh
fi
