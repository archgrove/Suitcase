if [ -f ~/.suitcase/.profile ]; then
  . ~/.suitcase/.profile
fi

if [ -f ~/.suitcase/.bashrc ]; then
  . ~/.suitcase/.bashrc
fi

set -o vi
export PATH=$PATH:/Users/adamw/.local/bin

if which nvim > /dev/null; then
  export EDITOR=`which nvim`
else
  export EDITOR=`which vim`
fi
  

# Import the more usual bashrc file
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Ensure bash histories work well with tmux
shopt -s histappend
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.fastlane/bin:$PATH"
