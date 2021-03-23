# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	      . "$HOME/.bashrc"
    fi
fi

if [ -f "$HOME/.bash.private" ]; then
	  . "$HOME/.bash.private"
fi

export GOPATH=$HOME/src/go

export PATH=$(zsh ~/.path.zsh)

export TERMINAL="/usr/bin/alacritty"

# create i3 config file
HN=$(hostname)
DOT=$HOME/.dotfiles
CUSTOM=$DOT/i3/.i3/config.$HN
DEF=$DOT/i3/.i3/config.default
if [[ -f "$CUSTOM" ]]; then
	cat $CUSTOM > $DOT/i3/.i3/config
else
	cat $DEFAULT > $DOT/i3/.i3/config
fi
