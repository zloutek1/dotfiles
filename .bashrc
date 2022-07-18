#!/bin/bash

[[ $- != *i* ]] && return
shopt -s autocd

[ -f "$XDG_CONFIG_HOME/envvarrc" ] && source "$XDG_CONFIG_HOME/envvarrc"
[ -f "$XDG_CONFIG_HOME/aliasrc" ] && source "$XDG_CONFIG_HOME/aliasrc"

export PS1="[\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;33m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# remove background colors from ls
eval "$(dircolors -p | \
	sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
	dircolors /dev/stdin)"

# share histroy between terminals
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# flutter variables
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export CHROME_EXECUTABLE=/usr/bin/chromium
