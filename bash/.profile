# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export TERMINAL="/usr/bin/alacritty"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	      . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# go
export GOPATH=$HOME/code/go
export PATH=$PATH:/home/dare/bin:/usr/local/go/bin:/home/dare/code/go/bin:/usr/lib/postgresql/9.5/bin

# venv stuff
export WORKON_HOME=$HOME/code/venvs
export PROJECT_HOME=$HOME/code
source /usr/local/bin/virtualenvwrapper.sh
