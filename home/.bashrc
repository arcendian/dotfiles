# 
#  ▄▄▄▄▄    ▄▄    ▄▄▄▄  ▄    ▄ ▄▄▄▄▄    ▄▄▄
#  █    █   ██   █▀   ▀ █    █ █   ▀█ ▄▀   ▀
#  █▄▄▄▄▀  █  █  ▀█▄▄▄  █▄▄▄▄█ █▄▄▄▄▀ █
#  █    █  █▄▄█      ▀█ █    █ █   ▀▄ █
#  █▄▄▄▄▀ █    █ ▀▄▄▄█▀ █    █ █    ▀  ▀▄▄▄▀
# 
# Michael Espeña (https://github.com/Arcendian/dotfiles)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
export GOPATH=$HOME/.local/go
export PATH=$HOME/.local/go/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH

# c/c++ include paths when programming avr
# export C_INCLUDE_PATH=${C_INCLUDE_PATH}:/usr/avr/include
# export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:/usr/avr/include

alias ls='exa'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

if [ -r $HOME/.bash_aliases ]
then
	. ~/.bash_aliases
fi

# NOTE: ~/.dir_colors to nord-dircolors develop branch
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

PS1='[\u@\h \W]\$ '
