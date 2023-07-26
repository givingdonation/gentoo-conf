# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
export PATH="/home/carlo/.config/emacs/bin:/home/carlo/.local/bin:$PATH"

alias l='ls -hF'
alias la='l -Al'

alias df='df -h'
alias du='du -h'
alias md='mkdir'
alias xo='xdg-open'
alias n='nvim'
alias gi='ghci-9.6.2'
alias d='emacsclient -c -nw'
alias bright='xrandr --output HDMI-1 --brightness'

[ -f "/home/carlo/.ghcup/env" ] && source "/home/carlo/.ghcup/env" # ghcup-env

if [ $0 == "-bash" ]; then
	exec startx
fi
# pnpm
export PNPM_HOME="/home/carlo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


XDG_CONFIG_HOME=/home/carlo/.config
TERM=xterm-256color
