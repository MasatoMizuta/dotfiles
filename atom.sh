#!/usr/sh

# Install Atom sync-settings package
if [ ! -e $HOME/.atom/packages/sync-settings ]; then
    apm install sync-settings
fi
