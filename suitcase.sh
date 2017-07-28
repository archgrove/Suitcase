#!/bin/bash

set -e

# This script either...
#   "unpack"s a suitcase, linking configuration files into the checked out
#   suitcase repository having copied any that already exist on the system
#   into safe keeping
#
#   "pack"s a suitcase, reversing the above
#
# Existing files are moved into ~/.suitcase

CWD=`pwd`
SUITCASE_DIR=`dirname $CWD/$0`

function conditionalMv {
  if [ -f "$1" ]; then
    mv "$1" "$2"
  fi
}

function unpack {
  # Build a place to put files already present on the machine

  if [ -d ~/.suitcase ]; then
    echo "You already seem to have an unpacked Suitcase?"
    exit 1
  else
    mkdir ~/.suitcase
  fi

  # Package up existing files and move them into the suitcase
  conditionalMv ~/.vimrc ~/.suitcase/.vimrc
  conditionalMv ~/.vim ~/.suitcase/.vim
  conditionalMv ~/.bashrc ~/.suitcase/.bashrc
  conditionalMv ~/.profile ~/.suitcase/.profile
  conditionalMv ~/.hushlogin ~/.suitcase/.hushlogin
  conditionalMv ~/.tmux.conf ~/.suitcase/.tmux.conf

  rm -rf "$SUITCASE_DIR/.vim"
  mkdir -p "$SUITCASE_DIR/.vim/bundle"

  git clone https://github.com/VundleVim/Vundle.vim.git "$SUITCASE_DIR/.vim/bundle/Vundle.vim"

  ln -s "$SUITCASE_DIR/.vim" ~/.vim
  ln -s "$SUITCASE_DIR/.vimrc" ~/.vimrc
  mkdir -p ~/.config/nvim
  ln -s "$SUITCASE_DIR/.nvimrc" ~/.config/nvim/init.vim
  ln -s "$SUITCASE_DIR/.profile" ~/.profile
  ln -s "$SUITCASE_DIR/.bashrc" ~/.bashrc
  ln -s "$SUITCASE_DIR/.hushlogin" ~/.hushlogin
  ln -s "$SUITCASE_DIR/.tmux.conf" ~/.tmux.conf

  vim +PluginInstall +qall

  git config --global core.editor > ~/.suitcase/gitCoreEditor
  git config --global core.editor /usr/bin/vim

  echo "Unpacked, and feeling at home"
}

function pack {
  if [ ! -d ~/.suitcase ]; then
    echo "You don't seem to have an unpacked suitcase"
    exit 2
  fi

  rm ~/.vim
  rm ~/.vimrc
  rm -r ~/.config/nvim/
  rm ~/.profile
  rm ~/.bashrc
  rm ~/.hushlogin
  rm ~/.tmux.conf

  conditionalMv ~/.suitcase/.vim ~
  conditionalMv ~/.suitcase/.vimrc ~
  conditionalMv ~/.suitcase/.profile ~
  conditionalMv ~/.suitcase/.bashrc ~
  conditionalMv ~/.suitcase/.tmux.conf ~
  
  git config --global core.editor `cat ~/.suitcase/gitCoreEditor`
  rm ~/.suitcase/gitCoreEditor

  rmdir ~/.suitcase

  echo "Packed up and ready to roll"
}

if [ "$1" = "pack" ]; then
   pack
elif [ "$1" = "unpack" ]; then
   unpack
else
  echo "Usage: suitcase.sh (pack | unpack)"
fi
