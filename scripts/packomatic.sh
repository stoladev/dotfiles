#!/bin/bash


# TODO add scripts to local bin


PKGS=(


    # LTS Kernel Safety
    # 'linux-lts'                     # Long term support kernel
    # 'linux-lts-headers'             # LTS headers
    # 'linux-firmware'                # Necessary firmware


    # Uncalled Dependencies         # Dependencies that don't get called
    # 'avahi'
    # 'cmake'
    # 'rust'


    # Default Programs
    # 'networkmanager'                # Network manager
    # 'zsh'                           # CLI manager
    # 'i3'                            # Desktop manager
    # 'antigen'                       # Plugin manager for ZSH
    # 'tmux'                          # Terminal wrapper to make CLI a breeze
    # 'filezilla'                     # FTP client
    # 'thunderbird'                   # Email client
    # 'whatsapp-nativefier-dark'      # WhatsApp client
    # 'alsa-utils'                    # Alsa utilities
    # 'pulseaudio-alsa'               # Pulseaudio manager interface with alsa
    # 'pulseaudio'                    # Audio manager
    # 'asoundconf'                    # Default sound config that just works(TM)
    # 'obs-studio'                    # Best recording software hands down
    # 'vlc'                           # Audio/video codecs, player
    # 'scrot'                         # Screenshotter
    # 'maim'                          # Screenshotter alternative
    # 'ranger'                        # CLI directory/file browser
    # 'xclip'                         # Clipboard manager
    # 'arandr'                        # Monitor adjuster
    # 'youtube-dl'                    # Easy video/audio downloading
    # 'amdvlk'                        # Graphics driver, Open
    # 'vulkan-radeon'                 # Graphics driver, RADV, part of Mesa project
    # 'zenith'                        # HTOP but in rust and better
    # 'ncspot'                        # Spotify ncurses player
    # 'qbittorrent'                   # Torrent client


    # Development
    # 'git'                           # Git access
    # 'neovim'                        # Best and most malleable text editor by far
    # 'zathura'                       # PDF and similar editor
    # 'xcape'                         # Allows for multi-function combos, i.e. spacebar modifier
    # 'xorg-xmodmap'                  # Keyboard remaps i.e. caps to escape
    # 'python'                        # Python development
    # 'python-pip'                    # Pip install
    # 'npm'                           # Package manager for js
    # 'qtcreator'                     # Creating GUI apps with ease
    # 'tk'                            # Tkinter for GUI handling


    # Fuzzy File Searching
    # 'fzf'                           # Fuzzy file finder
    # 'fd'                            # FZF alternative with other functions
    # 'ripgrep'                       # grep but with rust, blazing fast


    # Misc Utilities
    # 'ueberzug'                      # Allows image viewing within terminal
    # 'picom'                         # Formerly compton; transparency engine
    # 'feh'                           # Image viewer, used for background wallpapers
    # 'wireguard-lts'                 # LTS version of wireguard for VPN
    # 'wireguard-tools'               # Misc wireguard tools for troubleshooting
    # 'font-manager'                  # Font manager
    # 'qtfm'                          # Qt based file manager


    # Windows Emulation/Gaming Essential Package (AMD ONLY)
    # 'lutris'
    # 'lib32-mesa'
    # 'vulkan-radeon'
    # 'lib32-vulkan-radeon'
    # 'vulkan-icd-loader'
    # 'lib32-vulkan-icd-loader'
    # 'wine-staging'
    # 'giflib'
    # 'lib32-giflib'
    # 'libpng'
    # 'lib32-libpng'
    # 'libldap'
    # 'lib32-libldap'
    # 'gnutls'
    # 'lib32-gnutls'
    # 'mpg123'
    # 'lib32-mpg123'
    # 'openal'
    # 'lib32-openal'
    # 'v4l-utils'
    # 'lib32-v4l-utils'
    # 'libpulse'
    # 'lib32-libpulse'
    # 'libgpg-error'
    # 'lib32-libgpg-error'
    # 'alsa-plugins'
    # 'lib32-alsa-plugins'
    # 'alsa-lib'
    # 'lib32-alsa-lib'
    # 'libjpeg-turbo'
    # 'lib32-libjpeg-turbo'
    # 'sqlite'
    # 'lib32-sqlite'
    # 'libxcomposite'
    # 'lib32-libxcomposite'
    # 'libxinerama'
    # 'lib32-libgcrypt'
    # 'libgcrypt'
    # 'lib32-libxinerama'
    # 'ncurses'
    # 'lib32-ncurses'
    # 'opencl-icd-loader'
    # 'lib32-opencl-icd-loader'
    # 'libxslt'
    # 'lib32-libxslt'
    # 'libva'
    # 'lib32-libva'
    # 'gtk3'
    # 'lib32-gtk3'
    # 'gst-plugins-base-libs'
    # 'lib32-gst-plugins-base-libs'


    # Fonts
    # 'ttf-iosevka'
    # 'ttf-iosevka-term'
    # 'ttf-iosevka-term-ss04'
    # 'ttf-symbola'
    # 'noto-fonts-emoji'
    # 'ttf-joypixels'
    # 'powerline-fonts'


	)


# Python pip installations
PIPS=(


    # Formatters/Linters
    # 'black'                         # Formatter
    # 'flake8'                        # Linter
    # 'numpy'                         # Advanced math
    # 'requests'                      # HTTPS related accessibility/ease
    # 'pandas'                        # Dataframe management
    # 'Pillow'                        # Image classification
    # 'moviepy'                       # Video classification
    # 'jedi'                          # Autocompletion
    # 'neovim'                        # Neovim support
    # 'torch'                         # Pytorch
    # 'pyqt5'                         # GUI builder
    # 'pyqt5-tools'                   # Tools for pyqt5
    # 'matplotlib'                    # Plotting library


	)


# YAY Installation
# echo "Verifying yay installation..."
# if pacman -Qs yay > /dev/null ; then
#     echo "Installation verified."
# else
#     echo "No yay installation detected. Installing..."
#     cd "${HOME}/git" || exit
#     git clone "https://aur.archlinux.org/yay.git"
#     cd "${HOME}/git"/yay || exit
#     sudo pacman -S base-devel --noconfirm --needed
#     makepkg -si --noconfirm --needed
#     echo "Installation of yay complete."
# fi
# echo ""


# PKG Installation
# while true; do
#     read -p "Install recommended Arch packages? (y/n): " yn
#     case $yn in
#         [Yy]* )
#             for PKG in "${PKGS[@]}"; do
#                 if pacman -Qs "$PKG" > /dev/null ; then
#                     echo ""$PKG" is already installed."
#                 else
#                     echo ""$PKG" not installed. Installing..."
#                     yay -S --noconfirm "$PKG"
#                 fi
#             done
#             break;;
#         [Nn]* )
#             break;;
#     esac
# done
# echo ""


# Python Packages
# while true; do
#     read -p "Install recommended Python packages? (y/n): " yn
#     case $yn in
#         [Yy]* )
#             for PIP in "${PIPS[@]}"; do
#             if pip list | grep -F "$PIP" > /dev/null ; then
#                 echo ""$PIP" is already installed."
#             else
#                 echo ""$PIP" not installed. Installing..."
#                 pip install "$PIP"
#             fi
#             done
#             break;;
#         [Nn]* ) break;;
#     esac
# done
# echo ""


# Check PKG Updates
# while true; do
#     read -p "Update system packages? (y/n): " yn
#     case $yn in
#         [Yy]* ) sudo pacman -Syu --noconfirm --needed; break;;
#         [Nn]* ) break;;
#         * ) echo "Please use y or n.";;
#     esac
# done


# TODO Neovim full setup
# Plugin installation
# FZF/fd installation verification
