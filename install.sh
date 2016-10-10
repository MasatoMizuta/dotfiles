#!/usr/sh

# Install apps
source brew.sh
source zsh.sh
source osx.sh
source atom.sh

# Deploy dotfiles
for f in .??*
do
  [[ $f = ".git" ]] && continue
  [[ $f = ".DS_Store" ]] && continue
  ln -snfv $(pwd)/$f $HOME/$f
done
