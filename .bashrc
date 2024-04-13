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

export ALTERNATE_EDITOR=""                        # setting for emacsclient
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode


export PATH="/usr/local/texlive/2023/bin/x86_64-linux:/home/carlo/.config/emacs/bin:/home/carlo/.local/bin:$PATH"
export PATH="/home/carlo/.cargo/bin:$PATH"
alias l='ls -hF'
alias la='l -Al'

alias df='df -h'
alias du='du -h'
alias md='mkdir'
alias xo='xdg-open'
alias n='nvim'
alias gi='ghci-9.6.2'
alias d='emacsclient -c'
alias emrg='doas emerge -a'
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

PS1="\[\e]133;k;start_kitty\a\]\[\e]133;A\a\]\[\e]133;k;end_kitty\a\]\[\033]0;\u@\h:\W\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] \[\e]133;k;start_suffix_kitty\a\]\[\e[5 q\]\[\e]2;\W\a\]\[\e]133;k;end_suffix_kitty\a\]"
#PS1="\[\e]133;k;start_kitty\a\]\[\e]133;A\a\]\[\e]133;k;end_kitty\a\]\[\033]0;me@\h:\W\007\]\[\033[01;32m\]me@\h\[\033[01;34m\] \W \$\[\033[00m\] \[\e]133;k;start_suffix_kitty\a\]\[\e[5 q\]\[\e]2;\W\a\]\[\e]133;k;end_suffix_kitty\a\]"
XDG_CONFIG_HOME=/home/carlo/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_CACHE_HOME=$HOME/.cache


TERM=xterm-256color

neofetch
#neofetch --disable title CPU GPU

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
