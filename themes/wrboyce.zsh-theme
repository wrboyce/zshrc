## TODO:
# psvar[1] should contain git-repo-name:relative-path
ZSH_THEME_COLOUR_1="%{$fg[blue]%}"
ZSH_THEME_COLOUR_2="%{$fg[yellow]%}"


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

## Supporting functions
venv_prompt_info() {
    [ ! -z ${VIRTUAL_ENV} ] && echo "${ZSH_THEME_VENV_PROMPT_PREFIX}${VIRTUAL_ENV##*/}${ZSH_THEME_VENV_PROMPT_SUFFIX}"
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
