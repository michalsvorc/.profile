# Zsh configuration

#===============================================================================
# Local variables
#===============================================================================

local shell_partials_dir="$HOME/.local/profile/shell"

#===============================================================================
# Shared shell profile
#===============================================================================

source "$shell_partials_dir/profile.sh"

#===============================================================================
# Colors
#===============================================================================

autoload -U colors && colors

#===============================================================================
# Command prompt
#===============================================================================

PS1="%{$fg[yellow]%}%n@%m %{$fg[blue]%}%~%{$reset_color%} $%b "

# Git prompt integration
setopt PROMPT_SUBST
source "$shell_partials_dir/git_prompt.sh"

#===============================================================================
# Settings
#===============================================================================

# History file
HISTFILE=~/.cache/zsh_history

#===============================================================================
# Completion
#===============================================================================

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

#===============================================================================
# Vi mode
#===============================================================================

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes
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
echo -ne '\e[5 q' # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#===============================================================================
# zsh-syntax-highlighting
# Highlighting should be sourced at the end.
#===============================================================================

source "$HOME/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  2>/dev/null
