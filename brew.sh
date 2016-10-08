#!/usr/sh

# Install Homebrew if not installed
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Install apps in Brewfile
brew bundle -v

# Clean up cache
brew bundle cleanup
