## third party binaries / utilities


# `ls` replacement
zplugin ice from"gh-r" as"program" mv"*/lsd -> lsd"
zplugin light Peltoche/lsd
if (( $+commands[lsd] )); then
    (( ! $TERM_IS_FANCY )) && _lsd_args="--icon=never"
    alias l="lsd -lhAF --date relative ${_lsd_args}"
    zpcompdef l=lsd
    unset _lsd_args
fi

# `ssh` wrapper
if [ -f "${HOME}/.ssh/assh.yml" ]; then
    zplugin ice as"program" from"gh-r" mv"assh_* -> assh"
    zplugin light moul/assh
    (( $+commands[assh] )) && alias ssh='assh wrapper ssh'
fi

# `cat` replacement
zplugin ice as"program" from"gh-r" mv"bat-*/bat -> bat"
zplugin light sharkdp/bat
if (( $+commands[bat] )); then
    export BAT_THEME=base16
    alias b='bat'
    alias c='bat -p'
    alias cn='bat -n'
fi

# `find` replacement
zplugin ice as"program" from"gh-r" mv"fd-*/fd -> fd"
zplugin light sharkdp/fd

# `grep` replacement
zplugin ice as"program" from"gh-r" mv"ripgrep-*/rg -> rg"
zplugin light BurntSushi/ripgrep

# `diff` replacement
zplugin ice as"program" pick"third_party/build_fatpack/diff-so-fancy"
zplugin light so-fancy/diff-so-fancy
(( $+commands[diff-so-fancy] )) && alias dsf='diff-so-fancy'

# json parser
zplugin ice as"program" from"gh-r" mv"jq-* -> jq"
zplugin light stedolan/jq

# hex editor
zplugin ice as"program" from"gh-r" mv"hexyl-*/hexyl -> hexyl"
zplugin light sharkdp/hexyl

# fuzzy finder
zplugin ice as"program" from"gh-r"
zplugin light junegunn/fzf-bin

# fast directory navigation
zplugin ice as"program" pick"fasd"
zplugin light clvv/fasd

# docker-compose
if (( $+commands[docker] )); then
    zplugin ice as"program" from"gh-r" mv"docker-compose-* -> docker-compose"
    zplugin light docker/compose
fi

if (( $+commands[git] )) && [ -f "${HOME}/.gitconfig" ]; then
    zplugin ice id-as"github/hub-bin" as"program" from"gh-r" mv"hub-*/bin/hub -> hub"
    zplugin light github/hub
fi
