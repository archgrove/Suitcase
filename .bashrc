set -o vi
export PATH=$PATH:/Users/adamw/ResearchTools/verifast-r1138/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

alias vi=nvim
