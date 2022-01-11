#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

source /home/mice/.config/broot/launcher/bash/br
