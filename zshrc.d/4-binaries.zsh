## third party binaries / utilities


# `ls` replacement
zinit ice from"gh-r" as"program" pick"*/lsd"
zinit light Peltoche/lsd
if (( $+commands[lsd] )); then
    (( ! $TERM_IS_FANCY )) && _lsd_args="--icon=never"
    alias l="lsd -lhAF --date relative ${_lsd_args}"
    zpcompdef l=lsd
    unset _lsd_args
fi

# `ssh` wrapper
if [ -f "${HOME}/.ssh/assh.yml" ]; then
    zinit ice as"program" from"gh-r" mv"assh_* -> assh"
    zinit light moul/assh
    (( $+commands[assh] )) && alias ssh='assh wrapper ssh'
fi

# `cat` replacement
zinit ice as"program" from"gh-r" pick"bat-*/bat"
zinit light @sharkdp/bat
alias c='cat'
alias cn='cat -n'
if (( $+commands[bat] )); then
    export BAT_THEME="Solarized (dark)"
    alias b='bat'
    alias c='bat -p'
    alias cn='bat -n'
fi

# `find` replacement
zinit ice as"program" from"gh-r" pick"fd-*/fd"
zinit light @sharkdp/fd

# `grep` replacement
zinit ice as"program" from"gh-r" pick"ripgrep-*/rg"
zinit light BurntSushi/ripgrep

# `diff` replacement
zinit ice as"program" pick"third_party/build_fatpack/diff-so-fancy"
zinit light so-fancy/diff-so-fancy
(( $+commands[diff-so-fancy] )) && alias dsf='diff-so-fancy'

# json parser
zinit ice as"program" from"gh-r" mv"jq-* -> jq"
zinit light stedolan/jq

# hex editor
zinit ice as"program" from"gh-r" pick"hexyl-*/hexyl"
zinit light @sharkdp/hexyl

# fuzzy finder
zinit ice as"program" from"gh-r"
zinit light junegunn/fzf-bin

# fast directory navigation
zinit ice as"program" pick"fasd"
zinit light clvv/fasd

# docker-compose
if (( $+commands[docker] )); then
    zinit ice as"program" from"gh-r" bpick"*.tgz" mv"docker-compose-* -> docker-compose"
    zinit light docker/compose
fi

if (( $+commands[git] )) && [ -f "${HOME}/.gitconfig" ]; then
    zinit ice id-as"github/hub-bin" as"program" from"gh-r" pick"hub-*/bin/hub"
    zinit light github/hub
fi
