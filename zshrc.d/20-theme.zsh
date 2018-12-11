zplugin ice pick'scripts/base16-solarized-dark.sh'
zplugin light chriskempson/base16-shell

DEFAULT_USER='wrboyce'
P9K_MODE=nerdfont-complete
P9K_LEFT_PROMPT_ELEMENTS=(context ssh virtualenv dir vcs root_indicator)
P9K_RIGHT_PROMPT_ELEMENTS=(background_jobs)
P9K_CONTEXT_TEMPLATE_DEFAULT_USER="%m"
P9K_VIRTUALENV_ICON="\uF509"
P9K_DIR_SHOW_WRITABLE=true
P9K_DIR_SHORTEN_LENGTH=2
P9K_DIR_SHORTEN_DELIMITER='…'
P9K_DIR_SHORTEN_STRATEGY='truncate_with_package_name'
P9K_DIR_SHORTEN_PKG_SEPARATOR=':'
P9K_DIR_SHORTEN_GIT_FALLBACK=true
P9K_DIR_SHORTEN_GIT_FALLBACK_USE_REMOTE=true
zplugin ice pick'powerlevel9k.zsh-theme' wait'!0' lucid
if [ -d "${HOME}/dev/powerlevel9k" ]; then
    zplugin load "${HOME}/Dev/powerlevel9k"
else
    zplugin load wrboyce/powerlevel9k
fi

zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions

zsh_history_bindings=(
    "bindkey '^[[A' history-substring-search-up"
    "bindkey '^[[B' history-substring-search-down"
)
zplugin ice wait'0' atload"${(j:; :)zsh_history_bindings}" lucid
zplugin light zsh-users/zsh-history-substring-search
unset zsh_history_bindings

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
fast_syntax_atinit=(
    "ZPLGM[COMPINIT_OPTS]=-C"
    "zpcompinit"
    "zpcdreplay"
)
zplugin ice wait'1' atinit"${(j:; :)fast_syntax_atinit}" lucid
zplugin light zdharma/fast-syntax-highlighting
unset fast_syntax_atinit
