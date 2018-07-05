#!/bin/bash
# github.com/savoca/dotfiles

set -e

PIC=~/tmp/screen.png

scrot $PIC
convert $PIC -scale 10% -scale 1000% $PIC
[[ -f $1 ]] && convert $PIC $1 -gravity center -composite -matte $PIC
i3lock -u -i $PIC
rm $PIC
