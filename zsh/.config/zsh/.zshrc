# 
#  ▄▄▄▄▄▄  ▄▄▄▄  ▄    ▄ ▄▄▄▄▄    ▄▄▄
#      █▀ █▀   ▀ █    █ █   ▀█ ▄▀   ▀
#    ▄█   ▀█▄▄▄  █▄▄▄▄█ █▄▄▄▄▀ █
#   ▄▀        ▀█ █    █ █   ▀▄ █
#  ██▄▄▄▄ ▀▄▄▄█▀ █    █ █    ▀  ▀▄▄▄▀
# 
# Michael Espeña (https://github.com/JustAnotherJerry/.dotfiles)

# Enable colors
autoload -U colors && colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Set default editor
export EDITOR=vim

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)             # Include hidden files

# emulate emacs keybindings
bindkey -e
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^x^e' edit-command-line

# nord theme for linux console
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P03b4252
  \e]P1bf616a
  \e]P2a3be8c
  \e]P3ebcb8b
  \e]P481a1c1
  \e]P5b48ead
  \e]P688c0d0
  \e]P7e5e9f0
  \e]P84c566a
  \e]P9bf616a
  \e]PAa3be8c
  \e]PBebcb8b
  \e]PC81a1c1
  \e]PDb48ead
  \e]PE8fbcbb
  \e]PFeceff4
  "
  # get rid of artifacts
  clear
  echo
  fm6000 -f $HOME/.local/share/scripts/bling.txt --de=bspwm -c blue
  echo
fi

if [ "$TERM" != "linux" ] && [ "$TERM" != "xterm-256color" ]; then
  fm6000 -f $HOME/.local/share/scripts/bling.txt --de=bspwm -c blue
fi

if [ "$TERM" = "xterm-256color" ]; then
  figlet "terminal inside" \
	  -f /usr/share/figlet/future -w 200 | lolcat
fi
