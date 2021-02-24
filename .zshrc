export XDG_DOTFILES_HOME="$HOME/.config"
export XDG_CONFIG_HOME="$XDG_DOTFILES_HOME"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_SCRIPTS_HOME="$HOME/scripts"
export XDG_GIT_HOME="$HOME/git"
export XDG_APYADAY_HOME="$XDG_GIT_HOME/python-projects/a-py-a-day"
export XDG_VIMWIKI_HOME="$HOME/vimwiki"

export LOCAL_BINS=/usr/local/bin:/Users/stoladev/.local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/opt/python/libexec/bin

export PATH="$LOCAL_BINS:/usr/bin:/bin:/usr/sbin:/sbin"

export EDITOR="nvim"

# Notes: 
# Use "chpwd() ls" to enable an automatic ls command after moving to a new directory.
chpwd() {
	gls -ahFGH --color=auto --group-directories-first
	# ls -ahFGH --color=auto --group-directories-first # Ubuntu/Arch/Debian
}

# {{{ ZSH General Settings

ZSH_THEME="robbyrussell"
HISTFILE=$XDG_CACHE_HOME/zsh/history

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
# }}}

# {{{ Plugins through Antigen

source ~/.config/antigen.zsh


# Load the oh-my-zsh's library.
antigen use oh-my-zsh


# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle 256color
# antigen bundle heroku
# antigen bundle lein
# antigen bundle command-not-found


# Auto suggestions and completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
antigen theme af-magic


# Tell Antigen that you're done.
antigen apply
# }}}

# {{{ Commands and Aliases

# SSH connections
alias ssh-mindhome="ssh -i ~/ssh-keys/LightsailDefaultKey-us-east-1.pem ubuntu@100.25.246.26"

# Image preview in terminal
# function lsix() { montage -label %f -background black -fill white "$@" gif:- | convert - -colors 16 sixel:-; }
function lsix() { montage -label %f -background black -fill white "$@" gif:- | convert - -colors 32 sixel:-; }

# Automatic Tmux on term launch
(command -v tmux &> /dev/null && [ -z "$TMUX" ]) && (tmux attach -t default || tmux new -s default)


# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"


# Useful default settings
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -v" \
	mkdir="mkdir -pv" \
	ls="gls -ahFGH --color=auto --group-directories-first" # Macbook after installing coreutils
	# ls="ls -ahFGH --color=auto --group-directories-first" # Ubuntu/Arch/Debian

# Dotfiles tracking directory
alias dotfiles='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'

	# ls="ls -a -hN --color=auto --group-directories-first" 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# }}}

# {{{ Optional Settings
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# export ZSH_CUSTOM=$ZDOTDIR/.oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# source ~/.oh-my-zsh/oh-my-zsh.sh


# User configuration


# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# }}}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/stoladev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

