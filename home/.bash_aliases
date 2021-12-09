# 
#    ▄▄   ▄      ▄▄▄▄▄    ▄▄    ▄▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄
#    ██   █        █      ██   █▀   ▀ █      █▀   ▀
#   █  █  █        █     █  █  ▀█▄▄▄  █▄▄▄▄▄ ▀█▄▄▄
#   █▄▄█  █        █     █▄▄█      ▀█ █          ▀█
#  █    █ █▄▄▄▄▄ ▄▄█▄▄  █    █ ▀▄▄▄█▀ █▄▄▄▄▄ ▀▄▄▄█▀
# 
# Michael Espeña (https://github.com/Arcendian/dotfiles)

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='exa --icons'
alias ll='exa --long --git --all --icons'
alias lL='exa --long --git --icons'
alias lr='exa --recurse --icons'
alias la='exa --all --icons'
alias lA='exa -1a --icons'
alias lt='exa --tree --icons'
alias lD='exa --only-dirs --icons'
alias lDa='exa --only-dirs --all --icons'

alias thumbnail='youtube-dl --write-thumbnail --skip-download'
alias yta='youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'

# fzf files and then open in nvim
alias nfzf='nv `fzf --preview="bat --color always {}"`'
