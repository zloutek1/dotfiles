#!/bin/bash

[[ $- != *i* ]] && return
shopt -s autocd
HISTSIZE= HISTFILESIZE= # Infinite history.


export PS1="[\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;33m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"


[ -f "$HOME/.config/envvarrc" ] && source "$HOME/.config/envvarrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# remove background colors from ls
eval "$(dircolors -p | \
	sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
	dircolors /dev/stdin)"


# flutter variables
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export CHROME_EXECUTABLE=/usr/bin/chromium
