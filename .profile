set -o vi
export PATH=$PATH:/Users/adamw/.local/bin

# Import the more usual bashrc file
. ~/.bashrc

# Ensure bash histories work well with tmux
shopt -s histappend
