#!/bin/bash
[[ $- != *i* ]] && return
shopt -s autocd
HISTSIZE= HISTFILESIZE= # Infinite history.

export PS1="[\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;33m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# remove background colors from ls
eval "$(dircolors -p | \
	sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
	dircolors /dev/stdin)"

