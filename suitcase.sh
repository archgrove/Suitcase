#!/bin/bash

# This script either...
#   "unpack"s a suitcase, linking configuration files into the checked out
#   suitcase repository having copied any that already exist on the system
#   into safe keeping
#
#   "pack"s a suitcase, reversing the above

CWD=`pwd`
SUITCASE_DIR=`dirname $CWD/$0`

function unpack {
  # Build a place to put files already present on the machine

  if [ -d ~/.suitcase ]; then
    echo "You already seem to have an unpacked Suitcase?"
    exit 1
  else
    mkdir ~/.suitcase
  fi

  # Package up existing files and move them into the suitcase
  if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.suitcase/.vimrc
  fi

  if [ -d ~/.vim ]; then
    mv ~/.vim ~/.suitcase/.vim
  fi

  if [ -d ~/.bashrc ]; then
    mv ~/.bashrc ~/.suitcase/.bashrc
  fi

  if [ -d ~/.profile ]; then
    mv ~/.profile ~/.suitcase/.profile
  fi

  ln -s "$SUITCASE_DIR/.vim" ~/.vim
  ln -s "$SUITCASE_DIR/.vimrc" ~/.vimrc
  ln -s "$SUITCASE_DIR/.profile" ~/.profile
  ln -s "$SUITCASE_DIR/.bashrc" ~/.bashrc

  echo "Unpacked, and feeling at home"
}

function pack {
  if [ ! -d ~/.suitcase ]; then
    echo "You don't seem to have an unpacked suitcase"
    exit 2
  fi

  rm ~/.vim
  rm ~/.vimrc
  rm ~/.profile
  rm ~/.bashrc

  if [ -f ~/.suitcase/.vim ]; then
    mv ~/.suitcase/.vim ~
  fi

  if [ -f ~/.suitcase/.vimrc ]; then
    mv ~/.suitcase/.vimrc ~
  fi

  if [ -f ~/.suitcase/.profile ]; then
    mv ~/.suitcase/.profile ~
  fi

  if [ -f ~/.suitcase/.bashrc ]; then
    mv ~/.suitcase/.bashrc ~
  fi
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
