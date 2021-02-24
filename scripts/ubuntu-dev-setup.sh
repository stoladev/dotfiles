#!/bin/bash

# Default installation script for Ubuntu dev environments through CLI

    # 'antigen'                       # Plugin manager for ZSH

PKGS=(

    # Default Programs
    'zsh'                           # CLI manager
    'tmux'                          # Terminal wrapper to make CLI a breeze
    'ranger'                        # CLI directory/file browser
    'xclip'                         # Clipboard manager

    # Development
    'git'                           # Git access
    'neovim'                        # Best and most malleable text editor by far
    'xcape'                         # Allows for multi-function combos, i.e. spacebar modifier
    'xorg-xmodmap'                  # Keyboard remaps i.e. caps to escape
    'python'                        # Python development
    'python3-pip'                    # Pip install
    'nodejs'                        # js utility
    'npm'                           # Package manager for js

    # Fuzzy File Searching
    'fzf'                           # Fuzzy file finder
    'fd-find'                        # FZF alternative with other functions
    'ripgrep'                       # grep but with rust, blazing fast

	)


# Python pip installations
PIPS=(

    # Formatters/Linters
    'black'                         # Formatter
    'flake8'                        # Linter
    'numpy'                         # Advanced math
    'requests'                      # HTTPS related accessibility/ease
    'pandas'                        # Dataframe management
    'Pillow'                        # Image classification
    'moviepy'                       # Video classification
    'jedi'                          # Autocompletion
    'neovim'                        # Neovim support
    'torch'                         # Pytorch
    'pyqt5'                         # GUI builder
    'pyqt5-tools'                   # Tools for pyqt5
    'matplotlib'                    # Plotting library

	)


# Update and upgrade
yes | sudo apt update
yes | sudo apt upgrade

# Installs antigen and ZSH.
[[ -e ~/.oh-my-zsh ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[[ -f ~/.config/antigen.zsh ]] && curl -L git.io/antigen > ~/.config/antigen.zsh


# PKG Installation
while true; do
    read -p "Install system packages? (y/n): " yn
    case $yn in
        [Yy]* )
            for PKG in "${PKGS[@]}"; do
                sudo apt -y install "$PKG"
            done
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""


# Pip Python Pkg Installation
while true; do
    read -p "Install pip (python3) packages? (y/n): " yn
    case $yn in
        [Yy]* )
            for PIP in "${PIPS[@]}"; do
                yes | pip3 install "$PIP"
            done
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""

# TODO
# Neovim full setup
# Plugin installation
# FZF/fd installation verification
