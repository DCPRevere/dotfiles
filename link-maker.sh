#!/usr/bin/bash

# shells
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# wm
mkdir ~/.i3
ln -s ~/.dotfiles/.i3rc ~/.i3/config

# editors
ls -s ~/.dotfiles/.vimrc ~/.vimrc
ls -s ~/.dotfiles/.emacs ~/.emacs
