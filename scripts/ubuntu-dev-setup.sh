#!/bin/bash

# Default installation script for Ubuntu dev environments through CLI

# Quick overview:
# First, it updates and upgrades the system.
# Installs default packages.
# Installs pip packages.
# Installs antigen (for ZSH).
# Installs OH-MY-ZSH.


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

while true; do
    read -p "Install neovim development profile? (y/n): " yn
    case $yn in
        [Yy]* )
            [[ -e ~/.config/nvim ]] || mkdir ~/.config/nvim
            cp -r ../.config/nvim/* ~/.config/nvim/
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""

# Runs nvim to do initial setup.
nvim

# Installing the .zshrc
while true; do
    read -p "Install .ZSHRC (recommended)? (y/n): " yn
    case $yn in
        [Yy]* )
            cp ../.zshrc ~/.zshrc
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""


# Installing tmux setup
while true; do
    read -p "Install .tmux config (recommended)? (y/n): " yn
    case $yn in
        [Yy]* )
            cp ../.tmux.conf ../.tmux.conf.local ../.tmux ~/
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""


# ZSH and Antigen installation
while true; do
    read -p "Install OH-MY-ZSH and Antigen (lots of CLI functionality)? (y/n): " yn
    case $yn in
        [Yy]* )
            OMZLINK="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
            [[ -f ~/.config/antigen.zsh ]] || curl -L git.io/antigen > ~/.config/antigen.zsh
            [[ -e ~/.oh-my-zsh ]] || sh -c "$(curl -fsSL $OMZLINK)" "" --keep-zshrc
            break;;
        [Nn]* )
            break;;
    esac
done
