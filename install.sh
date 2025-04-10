#!/bin/bash

# install.sh - Restores dotfiles and configurations

echo "Restoring dotfiles and configurations..."

# Restore fonts
echo "Restoring fonts to ~/.fonts..."
mkdir -p ~/.fonts
cp -r fonts/* ~/.fonts/

# Refresh font cache
echo "Refreshing font cache..."
fc-cache -fv

# Restore .bashrc
echo "Restoring .bashrc..."
cp bash/.bashrc ~/

# Restore .bashrc.d
echo "Restoring .bashrc.d..."
cp -r bash/.bashrc.d ~/

# Restore bin
echo "Restoring bin..."
cp -r bash/bin ~/

echo "Dotfiles and configurations restored successfully."