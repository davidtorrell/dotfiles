#!/bin/sh
set -e

cd ~/.ciber_dotfiles/vim_runtime
cat ~/.ciber_dotfiles/vim_runtime/vimrcs/basic.vim > ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
