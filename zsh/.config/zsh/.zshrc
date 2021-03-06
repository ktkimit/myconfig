# Config for zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{green}'
    fi
    echo "${gitstatuscolor} \ue0a0(${ref})"
  else
    echo ""
  fi
}
setopt PROMPT_SUBST
# PROMPT='%9c$(git_branch_test_color)%F{none} %# '

PS1='%F{7}[%f%F{7}%n%f%F{8}@%f%F{7}%M%f%F{7}]%f$(git_branch_test_color) %B%F{blue}%~%f%b'$'\n'"%F{7}>%f"

# History
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=$XDG_CACHE_HOME/zsh/history
setopt SHARE_HISTORY

# Basic auto/tab completion:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
 
# vi mode
bindkey -v
export KEYTIMEOUT=1
 
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Alias
alias ll="ls -lh --color=auto --group-directories-first"

# Load plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
