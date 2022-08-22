#!/bin/sh
setopt appendhistory

# Some useful options (man zshoptions)
setopt auto_cd auto_pushd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# Beeping is annoying
unsetopt BEEP

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=$XDG_CACHE_HOME/zsh/history
setopt SHARE_HISTORY

# Basic auto/tab completion:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Useful functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-fzf"
zsh_add_file "zsh-lf"
 
# Load plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"
