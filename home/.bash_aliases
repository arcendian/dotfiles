# 
#    ▄▄   ▄      ▄▄▄▄▄    ▄▄    ▄▄▄▄  ▄▄▄▄▄▄  ▄▄▄▄
#    ██   █        █      ██   █▀   ▀ █      █▀   ▀
#   █  █  █        █     █  █  ▀█▄▄▄  █▄▄▄▄▄ ▀█▄▄▄
#   █▄▄█  █        █     █▄▄█      ▀█ █          ▀█
#  █    █ █▄▄▄▄▄ ▄▄█▄▄  █    █ ▀▄▄▄█▀ █▄▄▄▄▄ ▀▄▄▄█▀
# 
# Michael Espeña (https://gitlab.com/Arcendian/dotfiles)

# default aliases from /etc/skel
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# exa, the colorized ls
alias ls='exa --icons'
alias ll='exa --long --git --all --icons'
alias lL='exa --long --git --icons'
alias lr='exa --recurse --icons'
alias la='exa --all --icons'
alias lA='exa -1a --icons'
alias lt='exa --tree --icons'
alias lD='exa --only-dirs --icons'
alias lDa='exa --only-dirs --all --icons'

# changing directory to rustling working directory
# alias rustling='cd /home/mice/.repos/applications/rustlings'

# for git bare repository for my dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME'

# LOL!
alias nano='$(which vim)'

# crypt='curl rate.sx/'
alias thumbnail='youtube-dl --write-thumbnail --skip-download'
alias yta='youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'
