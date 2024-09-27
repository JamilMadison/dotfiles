#!/bin/bash

# Create the dotfiles directory if it doesn't exist
mkdir -p ~/dotfiles

# Function to copy a directory if it exists
copy_if_exists() {
    if [ -d "$1" ]; then
        mkdir -p "$2"
        cp -r "$1" "$2"
        echo "$1 folder copied successfully."
    else
        echo "$1 folder not found."
    fi
}

# Copy kitty config
copy_if_exists ~/.config/kitty ~/dotfiles/.config/

# Copy fastfetch config
copy_if_exists ~/.config/fastfetch ~/dotfiles/.config/

# Create a list of installed themes
echo "Creating list of installed themes..."
themes_list=~/dotfiles/themes-list.txt
> "$themes_list"
if [ -d ~/.themes ]; then
    ls ~/.themes > "$themes_list"
    echo "List of themes saved to $themes_list"
else
    echo "No .themes folder found."
fi

# Create a list of installed icons
echo "Creating list of installed icons..."
icons_list=~/dotfiles/icons-list.txt
> "$icons_list"
if [ -d ~/.icons ]; then
    ls ~/.icons > "$icons_list"
    echo "List of icons saved to $icons_list"
else
    echo "No .icons folder found."
fi

# Copy wallpapers folder
copy_if_exists ~/wallpapers ~/dotfiles/wallpapers

# Backup dconf settings
dconf dump / > ~/dotfiles/dconf-settings.ini
echo "dconf settings exported successfully."

# Create a list of installed extensions with their URLs
echo "Creating list of installed extensions..."
extensions_list=~/dotfiles/extensions-list.txt
> "$extensions_list"
for extension in ~/.local/share/gnome-shell/extensions/*; do
    if [ -d "$extension" ]; then
        uuid=$(basename "$extension")
        url=$(grep "url" "$extension/metadata.json" | cut -d '"' -f 4)
        if [ -n "$url" ]; then
            echo "$uuid $url" >> "$extensions_list"
        else
            echo "$uuid" >> "$extensions_list"
        fi
    fi
done
echo "List of installed extensions saved to $extensions_list"

echo "Dotfiles backup completed."
