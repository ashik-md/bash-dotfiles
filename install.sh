#!/bin/bash

# install.sh - Restores or uninstalls dotfiles and configurations

echo "Would you like to install or uninstall? (install/uninstall)"
read action

if [[ "$action" != "install" && "$action" != "uninstall" ]]; then
    echo "Invalid action. Please run the script again and specify 'install' or 'uninstall'."
    exit 1
fi

# Function to prompt for user confirmation
prompt_user() {
    read -p "$1 (y/n): " response
    case "$response" in
        y|Y ) return 0;;  # User wants to proceed
        n|N ) return 1;;  # User does not want to proceed
        * ) echo "Invalid response. Please answer 'y' or 'n'."; prompt_user "$1";;  # Invalid input, ask again
    esac
}

# Function to install
install() {
    echo "Restoring dotfiles and configurations..."

    # Restore fonts
    if prompt_user "Would you like to restore fonts to ~/.fonts?"; then
        echo "Restoring fonts to ~/.fonts..."
        mkdir -p ~/.fonts
        cp -r fonts/* ~/.fonts/

        # Refresh font cache
        echo "Refreshing font cache..."
        fc-cache -fv
    else
        echo "Skipping font restoration."
    fi

    # Restore .bashrc
    if prompt_user "Would you like to restore .bashrc?"; then
        echo "Restoring .bashrc..."
        cp bash/.bashrc ~/
    else
        echo "Skipping .bashrc restoration."
    fi

    # Restore .bashrc.d
    if prompt_user "Would you like to restore .bashrc.d?"; then
        echo "Restoring .bashrc.d..."
        cp -r bash/.bashrc.d ~/
    else
        echo "Skipping .bashrc.d restoration."
    fi

    # Restore bin
    if prompt_user "Would you like to restore bin?"; then
        echo "Restoring bin..."
        cp -r bash/bin ~/
    else
        echo "Skipping bin restoration."
    fi

    echo "Dotfiles and configurations restoration process completed."
}

# Function to uninstall
uninstall() {
    echo "Uninstalling dotfiles and configurations..."

    # Uninstall fonts
    if prompt_user "Would you like to remove fonts from ~/.fonts?"; then
        echo "Removing fonts from ~/.fonts..."
        rm -rf ~/.fonts/*
    else
        echo "Skipping font removal."
    fi

    # Remove .bashrc
    if prompt_user "Would you like to remove .bashrc?"; then
        echo "Removing .bashrc..."
        rm -f ~/.bashrc
    else
        echo "Skipping .bashrc removal."
    fi

    # Remove .bashrc.d
    if prompt_user "Would you like to remove .bashrc.d?"; then
        echo "Removing .bashrc.d..."
        rm -rf ~/.bashrc.d
    else
        echo "Skipping .bashrc.d removal."
    fi

    # Remove bin
    if prompt_user "Would you like to remove bin?"; then
        echo "Removing bin..."
        rm -rf ~/bin
    else
        echo "Skipping bin removal."
    fi

    echo "Dotfiles and configurations uninstallation process completed."
}

# Execute the appropriate action
if [ "$action" == "install" ]; then
    install
else
    uninstall
fi
