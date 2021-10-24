#
#  ▄▄▄▄▄▄  ▄▄▄▄  ▄    ▄ ▄▄▄▄▄▄ ▄▄   ▄ ▄    ▄
#      █▀ █▀   ▀ █    █ █      █▀▄  █ ▀▄  ▄▀
#    ▄█   ▀█▄▄▄  █▄▄▄▄█ █▄▄▄▄▄ █ █▄ █  █  █
#   ▄▀        ▀█ █    █ █      █  █ █  ▀▄▄▀
#  ██▄▄▄▄ ▀▄▄▄█▀ █    █ █▄▄▄▄▄ █   ██   ██
#
# Michael Espeña (https://github.com/JustAnotherJerry/.dotfiles)

# exporting section
# set ZDOTDIR for cleaner HOME
export ZDOTDIR=$HOME/.config/zsh

# set editor
export EDITOR=nvim

# set browser
export BROWSER=brave

# add local bin to path
export PATH="${HOME}/.local/bin:${PATH}"

# add cargo bin to path
export PATH="${HOME}/.cargo/bin:${PATH}"

# set GOPATH
export GOPATH="$HOME/.local/go"

# add go bin to path
export PATH="$HOME/.local/go/bin:$PATH"

# set bat colorscheme
export BAT_THEME=Nord

# set custom starship config file location
export STARSHIP_CONFIG="$HOME/.config/starship/starship_config.toml"

# npm
export npm_config_prefix="$HOME/.local"

# gpg homedir
# export GNUPGHOME="$HOME/.config/gnupg"

# enable colors for man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# c/c++ include paths when programming avr
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:/usr/avr/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:/usr/avr/include

# sourcing section

# enable syntax highlighting for zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# enable autosuggestions for zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# enable autosuggestions for zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null

source ~/.config/zsh/.zsh_aliases

# activate nord dircolors
# NOTE: ~/.dir_colors to nord-dircolors develop branch
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# enable starship prompt
eval "$(starship init zsh)"
