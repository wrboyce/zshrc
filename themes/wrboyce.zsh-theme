ZSH_THEME_COLOUR_1="%{$fg[blue]%}"
ZSH_THEME_COLOUR_2="%{$fg[yellow]%}"
[ ${UID} -eq 0 ] && ZSH_THEME_COLOUR_2="%{$fg[red]%}"

## make `ack` match the theme
export ACK_OPTIONS='--color-filename=cyan --color-match=magenta --color-lineno=bright_magenta'

## Git Info
# wrap branch in square brackets
ZSH_THEME_GIT_PROMPT_PREFIX="${ZSH_THEME_COLOUR_2}[${ZSH_THEME_COLOUR_1}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${ZSH_THEME_COLOUR_2}]%{${reset_color}%}"
# show a red cross if the repo is dirty, no flag for clean
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
# show an indicator if we are behind/ahead remote
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="${ZSH_THEME_COLOUR_1}↓%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="${ZSH_THEME_COLOUR_1}↑%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${ZSH_THEME_COLOUR_1}↕%{${reset_color}%}"

## Virtualenv Info
# wrap virtualenv name to match theme
ZSH_THEME_VENV_PROMPT_PREFIX="${ZSH_THEME_COLOUR_2}(${ZSH_THEME_COLOUR_1}"
ZSH_THEME_VENV_PROMPT_SUFFIX="${ZSH_THEME_COLOUR_2})%{${reset_color}%}"

## Virtualenv Info
# only show username if it does not match DEFAULT_USERNAME
ZSH_THEME_SUDO_PROMPT_PREFIX="${ZSH_THEME_COLOUR_1}"
ZSH_THEME_SUDO_PROMPT_SUFFIX="${ZSH_THEME_COLOUR_2}@%{${reset_color}%}"

## Command Colours (zsh-syntax-highlighting)
# this is mostly a work in progress
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta,bold,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta,bold,underline'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[path]='fg=magenta,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=magenta,underline'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=magenta,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta,underline'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=green'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[default]='fg=blue'

ZSH_HIGHLIGHT_STYLES[bracket-error]='bg=red'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=none,underline'

## Supporting functions
venv_prompt_info() {
    if [ ! -z ${VIRTUAL_ENV} ]; then
        local label=${VIRTUAL_ENV##*/}
        [ ! -z ${VIRTUAL_ENV_LABEL} ] && label="${label}${ZSH_THEME_COLOUR_2}:${ZSH_THEME_COLOUR_1}${VIRTUAL_ENV_LABEL}"
        echo "${ZSH_THEME_VENV_PROMPT_PREFIX}${label}${ZSH_THEME_VENV_PROMPT_SUFFIX}"
    fi
}
sudo_prompt_info() {
    [[ "${DEFAULT_USERNAME}" == "${USERNAME}" ]] || echo "${ZSH_THEME_SUDO_PROMPT_PREFIX}${USERNAME}${ZSH_THEME_SUDO_PROMPT_SUFFIX}"
}
git_pwd_is_repo() {
}
git_repo_name() {
    local git_dir="$(command git rev-parse --git-dir 2>/dev/null)"
    if [ ${#git_dir} -eq 4 ]; then
        git_dir=$PWD/$git_dir
    fi
    local git_root=$git_dir[0,-6]
    echo ${git_root##*/}
}
git_relative_pwd() {
    local git_dir="$(command git rev-parse --git-dir 2>/dev/null)"
    if [[ $git_dir == ".git" ]]; then
        git_dir=$PWD/$git_dir
        PWD=$PWD/
    fi
    local git_root=$git_dir[0,-6]
    echo ${PWD/(#i)$git_root/}
}
git_prompt_path() {
    echo "${ZSH_THEME_COLOUR_1}$(git_repo_name)${ZSH_THEME_COLOUR_2}:${ZSH_THEME_COLOUR_1}$(git_relative_pwd)%{${reset_color}%}"
}
function git_path_precmd() {
    if $(command git rev-parse --is-inside-work-tree 2>/dev/null); then
        psvar[1]=1
    else
        unset psvar
    fi
}
add-zsh-hook precmd git_path_precmd

PROMPT='$(venv_prompt_info)$(sudo_prompt_info)${ZSH_THEME_COLOUR_1}%m${ZSH_THEME_COLOUR_2}:${ZSH_THEME_COLOUR_1}%(1v#$(git_prompt_path)#%~)$(git_prompt_info)${ZSH_THEME_COLOUR_2}%#%{${reset_color}%} '
