#!/bin/bash

# Linux Setup Script - Create symbolic links for configurations
# This script creates symlinks from this repository to the standard config locations

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up configuration symlinks..."

# Backup existing configs if they exist
backup_if_exists() {
    if [ -e "$1" ] && [ ! -L "$1" ]; then
        echo "Backing up existing $1 to $1.backup"
        mv "$1" "$1.backup"
    fi
}

# Create Neovim config symlink
echo "Setting up Neovim configuration..."
mkdir -p ~/.config
backup_if_exists ~/.config/nvim
ln -sf "$SCRIPT_DIR" ~/.config/nvim
echo "✓ Neovim config linked to ~/.config/nvim"

# Create tmux config symlink
echo "Setting up tmux configuration..."
backup_if_exists ~/.tmux.conf
ln -sf "$SCRIPT_DIR/tmux/.tmux.conf" ~/.tmux.conf
echo "✓ tmux config linked to ~/.tmux.conf"

echo ""
echo "All configuration links created successfully!"
echo ""
echo "Note: If you had existing configurations, they have been backed up with .backup extension"
