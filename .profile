
export TERMINAL="xterm"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"

export STEAM_FRAME_FORCE_CLOSE=1

xrdb -merge "$XDG_CONFIG_HOME/X11/Xresources"
xmodmap "$XDG_CONFIG_HOME/X11/Xmodmap"
