(( $+commands[fzf] )) || return

if [ -z "${fzf_base}" ]; then
  fzfdirs=("${HOME}/.fzf" "/usr/local/opt/fzf" "/usr/share/fzf")
  for dir in ${fzfdirs}; do
      if [ -d "${dir}" ]; then
          fzf_base="${dir}"
          break
      fi
  done
fi

if [ -n "${fzf_base}" ]; then
    # use fd to generate file/dir lists (if available))
    if (( $+commands[fd] )); then
        _fzf_compgen_path() {
          fd --hidden --follow --exclude ".git" . "$1"
        }
        _fzf_compgen_dir() {
          fd --type d --hidden --follow --exclude ".git" . "$1"
        }
    fi

    # source "${fzf_base}/shell/completion.zsh"
    # source "${fzf_base}/shell/key-bindings.zsh"
    zplugin ice id-as'homebrew/fzf' multisrc'{completion,key-bindings}.zsh'
    zplugin load "${fzf_base}/shell"
else
  print "[error] Cannot find fzf installation directory!" >&2
fi

unset fzf_base
