(( $+commands[fasd] )) || return

# cache init script as to avoid binary execution and allow compilation
fasd_cache="${ZSH_HOME}/cache/fasd/init.zsh"
mkdir -p "${fasd_cache:h}" 2>/dev/null
if [[ ! -s "${fasd_cache}" || "${commands[fasd]}" -nt "${fasd_cache}" ]]; then
    # load everything but the aliases
    fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >! "${fasd_cache}"
    zcompile "${fasd_cache}"
fi
zplugin ice id-as'homebrew/fasd' pick'init.zsh'
zplugin load "${fasd_cache:h}"
unset fasd_cache

# needed for `z`, and only supplied with `--posix-aliases`
_fasd_cd() {
  if [ $# -le 1 ]; then
    fasd "$@"
  else
    local _fasd_ret="$(fasd -e 'printf %s' "$@")"
    [ -z "$_fasd_ret" ] && return
    [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
  fi
}

# use fzf if available
if (( $+commands[fzf] )); then
    vf() {
        [ $# -gt 0 ] && fasd -f -e ${EDITOR} "$*" && return
        local file
        file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && "${EDITOR}" "${file}" || return 1
    }

    vr() {
        [ $# -gt 0 ] && fasd -f -e ${EDITOR} "$*" && return
        local file
        file="$(fasd -Rfltb viminfo "$1" | fzf -1 -0 --no-sort +m)" && "${EDITOR}" "${file}" || return 1
    }

    z() {
        [ $# -gt 0 ] && _fasd_cd -d "$*" && return
        local dir
        dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
    }
else
    alias vf='fasd -f -e "${EDITOR}"'
    alias vr='fasd -f -t -e "${EDITOR}" -b viminfo'
    alias z='_fast_cd -d'
fi
