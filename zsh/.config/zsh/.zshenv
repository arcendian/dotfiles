#
#  ▄▄▄▄▄▄  ▄▄▄▄  ▄    ▄ ▄▄▄▄▄▄ ▄▄   ▄ ▄    ▄
#      █▀ █▀   ▀ █    █ █      █▀▄  █ ▀▄  ▄▀
#    ▄█   ▀█▄▄▄  █▄▄▄▄█ █▄▄▄▄▄ █ █▄ █  █  █
#   ▄▀        ▀█ █    █ █      █  █ █  ▀▄▄▀
#  ██▄▄▄▄ ▀▄▄▄█▀ █    █ █▄▄▄▄▄ █   ██   ██
#
# Michael Espeña (https://github.com/JustAnotherJerry/.dotfiles)

# exporting section
export ZDOTDIR=$HOME/.config/zsh
export EDITOR=nvim
export BROWSER=brave
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.cargo/bin:${PATH}"
export GOPATH="$HOME/.local/go"
export PATH="$HOME/.local/go/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export BAT_THEME=Nord
export STARSHIP_CONFIG="$HOME/.config/starship/starship_config.toml"
export npm_config_prefix="$HOME/.local"
export TERMINAL=kitty

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# c/c++ include paths when programming avr
#export C_INCLUDE_PATH=${C_INCLUDE_PATH}:/usr/avr/include
#export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:/usr/avr/include


# sourcing section
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
source ~/.config/zsh/.zsh_aliases

# NOTE: ~/.dir_colors to nord-dircolors develop branch
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

eval "$(starship init zsh)"
