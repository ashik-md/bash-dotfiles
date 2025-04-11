#!/bin/bash

# Function to handle copying with overwrite confirmation
safe_copy() {
    local src="$1"
    local dest="$2"

    # Check if the destination exists
    if [[ -e "$dest" || -L "$dest" ]]; then
        # Prompt for confirmation to overwrite
        read -p "File/directory '$dest' already exists. Overwrite? (y/n): " confirm
        if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
            # Overwrite the destination
            cp -rf "$src" "$dest"
            echo "Overwritten: $dest"
        else
            echo "Skipped: $dest"
        fi
    else
        # Destination does not exist, proceed with copying
        cp -r "$src" "$dest"
        echo "Copied: $dest"
    fi
}

# Main script logic

echo "Starting the copy process..."

# 1. Copy the 'bin' folder to ~/
echo "Copying 'bin' folder to ~/ ..."
safe_copy "bin" "$HOME/bin"

# 2. Copy '.bashrc' to ~/
echo "Copying '.bashrc' to ~/ ..."
safe_copy ".bashrc" "$HOME/.bashrc"

# 3. Copy everything inside 'fonts/' to ~/.fonts
if [[ -d "fonts" ]]; then
    echo "Copying contents of 'fonts/' to ~/.fonts ..."
    mkdir -p "$HOME/.fonts"  # Ensure the destination directory exists
    for item in fonts/*; do
        if [[ -e "$item" ]]; then
            safe_copy "$item" "$HOME/.fonts/$(basename "$item")"
        fi
    done
else
    echo "Error: 'fonts/' directory does not exist."
fi

# 4. Copy everything inside 'icons/' to ~/.icons
if [[ -d "icons" ]]; then
    echo "Copying contents of 'icons/' to ~/.icons ..."
    mkdir -p "$HOME/.icons"  # Ensure the destination directory exists
    for item in icons/*; do
        if [[ -e "$item" ]]; then
            safe_copy "$item" "$HOME/.icons/$(basename "$item")"
        fi
    done
else
    echo "Error: 'icons/' directory does not exist."
fi

# 5. Check if 'foot' terminal is installed and copy foot.ini
if command -v foot &> /dev/null; then
    echo "Foot terminal is installed. Copying 'foot.ini' to ~/.config/foot/ ..."
    mkdir -p "$HOME/.config/foot"  # Ensure the destination directory exists
    safe_copy "foot.ini" "$HOME/.config/foot/foot.ini"
else
    echo "Foot terminal is not installed. Skipping 'foot.ini' copy."
fi

echo "Copy process completed."
