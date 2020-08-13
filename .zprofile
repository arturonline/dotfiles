#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here.

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"
#export PATH="$PATH:$(du "$HOME/bin/" | cut -f2 | paste -sd ':')"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export LESSHISTFILE="-"

# Other program settings:
#export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.

export _JAVA_AWT_WM_NONREPARENTING=1

#unclutter & 		# remove mouse when idle
#xset r rate 300 50 &    # vim speed
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' # use Caps as Escape
