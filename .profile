. ~/.suitcase/.profile
. ~/.suitcase/.bashrc

set -o vi

# Import the more usual bashrc file
. ~/.bashrc

# Ensure bash histories work well with tmux
shopt -s histappend

export EDITOR=`which vim`
