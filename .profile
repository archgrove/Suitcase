set -o vi
export PATH=$PATH:/Users/adamw/.local/bin
export EDITOR=`which vim`

# Import the more usual bashrc file
. ~/.bashrc

# Ensure bash histories work well with tmux
shopt -s histappend

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.fastlane/bin:$PATH"
