#!/bin/sh
# Some useful options (man zshoptions)
setopt appendhistory
setopt auto_cd auto_pushd extendedglob nomatch #menucomplete
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
# HISTORY_IGNORE="(cd(|..)|l[ls]|cd|clear|fg|exit|pwd|( |\t)*|history|nvim)" # not working
HISTFILE=$XDG_CACHE_HOME/zsh/history
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
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
zsh_add_file "zsh-yazi"
 
# Load plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"
