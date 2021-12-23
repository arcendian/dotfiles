# 
#  ▄▄▄▄▄    ▄▄    ▄▄▄▄  ▄    ▄ ▄▄▄▄▄    ▄▄▄
#  █    █   ██   █▀   ▀ █    █ █   ▀█ ▄▀   ▀
#  █▄▄▄▄▀  █  █  ▀█▄▄▄  █▄▄▄▄█ █▄▄▄▄▀ █
#  █    █  █▄▄█      ▀█ █    █ █   ▀▄ █
#  █▄▄▄▄▀ █    █ ▀▄▄▄█▀ █    █ █    ▀  ▀▄▄▄▀
# 
# Michael Espeña (https://gitlab.com/paperbackwriter/dotfiles)

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

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
__zoxide_oldpwd="$(__zoxide_pwd)"

function __zoxide_hook() {
    \builtin local -r retval="$?"
    \builtin local -r pwd_tmp="$(__zoxide_pwd)"
    if [[ ${__zoxide_oldpwd} != "${pwd_tmp}" ]]; then
        __zoxide_oldpwd="${pwd_tmp}"
        \builtin command zoxide add -- "${__zoxide_oldpwd}"
    fi
    return "${retval}"
}

# Initialize hook.
if [[ ${PROMPT_COMMAND:=} != *'__zoxide_hook'* ]]; then
    PROMPT_COMMAND="__zoxide_hook;${PROMPT_COMMAND#;}"
fi

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    if [[ $# -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ $# -eq 1 && $1 == '-' ]]; then
        __zoxide_cd "${OLDPWD}"
    elif [[ $# -eq 1 && -d $1 ]]; then
        __zoxide_cd "$1"
    elif [[ ${*: -1} == "${__zoxide_z_prefix}"* ]]; then
        \builtin local result="${*: -1}"
        __zoxide_cd "${result:2}"
    else
        \builtin local result
        result="$(\builtin command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" && __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\builtin command zoxide query -i -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset() {
    \builtin unset -f "$@" &>/dev/null
    \builtin unset -v "$@" &>/dev/null
    \builtin unalias "$@" &>/dev/null || \builtin :
}

__zoxide_unset z
function z() {
    __zoxide_z "$@"
}

__zoxide_unset zi
function zi() {
    __zoxide_zi "$@"
}

# Load completions.
# Completions require line editing. Since Bash supports only two modes of line
# editing (`vim` and `emacs`), we check if one of them is enabled.
if [[ :"${SHELLOPTS}": =~ :(vi|emacs): && ${TERM} != 'dumb' ]]; then
    # Use `printf '\e[5n'` to redraw line after fzf closes.
    \builtin bind '"\e[0n": redraw-current-line' &>/dev/null

    function _z() {
        # Only show completions when the cursor is at the end of the line.
        [[ ${#COMP_LINE} -eq ${COMP_POINT} ]] || return

        # If there is only one argument, use `cd` completions.
        if [[ ${#COMP_WORDS[@]} -eq 2 ]]; then
            \builtin mapfile -t COMPREPLY < <(compgen -A directory -S / -- "${COMP_WORDS[-1]}")
        # If there is a space after the last word, use interactive selection.
        elif [[ -z ${COMP_WORDS[-1]} ]]; then
            \local result
            result="$(
                _ZO_FZF_OPTS='--bind=ctrl-z:ignore --exit-0 --height=35% --inline-info --no-sort --reverse --select-1' \
                    \builtin command zoxide query -i -- "${COMP_WORDS[@]:1}"
            )" && COMPREPLY=("${__zoxide_z_prefix}${result}")
            \builtin printf '\e[5n'
        fi
    }

    \builtin complete -F _z -o nospace -- z
fi

# =============================================================================
#
# Initialize zoxide
#
eval "$(zoxide init bash)"
