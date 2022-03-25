prompt_smart_context() {
  local user host fg='blue'
  [ "${(%):-%n}" != "${DEFAULT_USER}" ] && user="${(%):-%n}"
  [ "${user}" = "root" ] && fg='red'
  (( P9K_SSH )) && host="${${(%):-%m}#1}"
  [ -n "${user}" ] && [ -n "${host}" ] && user="${user}@"
  p10k segment -f "${fg}" -t "${user}${host}"
}

darkmode() {
  zinit pick=scripts/base16-solarized-dark.sh for chriskempson/base16-shell
  zsource "${ZSH_HOME}/themes/base.zsh"
  zsource "${ZSH_HOME}/themes/dark.zsh"
  zsource "${ZSH_HOME}/themes/common.zsh"
}

lightmode() {
  zinit pick=scripts/base16-solarized-light.sh for chriskempson/base16-shell
  zsource "${ZSH_HOME}/themes/base.zsh"
  zsource "${ZSH_HOME}/themes/light.zsh"
  zsource "${ZSH_HOME}/themes/common.zsh"
}

darkmode

zinit ice src'powerlevel10k.zsh-theme' # wait'0' lucid
zinit light romkatv/powerlevel10k

zinit ice wait'1' atload'!_zsh_autosuggest_start' lucid
zinit light zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fast_syntax_atinit=(
    "ZINIT[COMPINIT_OPTS]=-C"
    "zicompinit"
    "zicdreplay"
)
zinit ice wait'2' atinit"${(j:; :)fast_syntax_atinit}" lucid
zinit light zdharma-continuum/fast-syntax-highlighting
unset fast_syntax_atinit
