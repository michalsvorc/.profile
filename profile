# Default Bash-like shell configuration

#===============================================================================
# Variables
#===============================================================================

shell_partials_dir="$HOME/.local/profile/shell"

#===============================================================================
# Initialization
#===============================================================================

source "$shell_partials_dir/test_interactive.sh"

#===============================================================================
# Environment variables
#===============================================================================

source "$shell_partials_dir/env_variables.sh"

#===============================================================================
# Aliases
#===============================================================================

source "$shell_partials_dir/aliases.sh"

#===============================================================================
# Settings
#===============================================================================

# History
HISTSIZE=10000
SAVEHIST=10000

#===============================================================================
# Bash
#===============================================================================

# Read configuration for Bash interactive shell
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

#===============================================================================
# lf integration
#===============================================================================

lf_config_dir="$HOME/.config/lf"

# Icons
source "$lf_config_dir/icons.sh"

# lf command for changing current directory
source "$lf_config_dir/lfcd.sh"
alias lf='lfcd'

