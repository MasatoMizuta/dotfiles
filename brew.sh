#!/usr/sh

# Install Homebrew if not installed
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Install apps in Brewfile
brew bundle -v

# Ricty
if [ ! -e ~/Library/Fonts/Ricty-Regular.ttf ]; then
    echo 'Install Ricty font'
    brew tap sanemat/font
    brew install ricty
    cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
    fc-cache -vf
fi

# Clean up cache
brew bundle cleanup
