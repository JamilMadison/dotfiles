#!/bin/bash
# Create the dotfiles directory if it doesn't exist
mkdir -p ~/dotfiles

# Function to copy a directory if it exists
copy_if_exists() {
    if [ -d "$1" ]; then
        mkdir -p "$(dirname "$2")"
        cp -r "$1" "$2"
        echo "$1 folder copied successfully."
    else
        echo "$1 folder not found."
    fi
}

# Copy kitty config
copy_if_exists ~/.config/kitty ~/dotfiles/.config/kitty

# Copy fastfetch config
copy_if_exists ~/.config/fastfetch ~/dotfiles/.config/fastfetch

# Copy .themes folder
copy_if_exists ~/.themes ~/dotfiles/.themes

# Copy .icons folder
copy_if_exists ~/.icons ~/dotfiles/.icons

# Copy wallpapers folder
copy_if_exists ~/wallpapers ~/dotfiles/wallpapers

# Copy GNOME Shell extensions
extensions_dir=~/.local/share/gnome-shell/extensions
copy_if_exists "$extensions_dir" ~/dotfiles/gnome-shell-extensions

# Backup dconf settings
dconf dump / > ~/dotfiles/dconf-settings.ini
echo "dconf settings exported successfully."

# Backup list of enabled extensions
gsettings get org.gnome.shell enabled-extensions > ~/dotfiles/enabled-extensions.txt
echo "List of enabled extensions saved."

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