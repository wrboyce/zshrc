## third party binaries / utilities

zinit as"program" from"gh-r" mv"direnv.* -> direnv" \
    atclone"./direnv hook zsh > zhook.zsh && zcompile zhook.zsh" atpull"%atclone" \
    pick"direnv" src"zhook.zsh" \
        for direnv/direnv

# fuzzy finder
zinit ice as"program" from"gh-r"
zinit light junegunn/fzf

# fast directory navigation
zinit ice as"program" pick"fasd"
zinit light clvv/fasd

# docker
zinit as=completion has=docker for https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# skip these on Apple Silicon :(
if [[ "${OSTYPE}-${MACHTYPE}" != darwin*-arm ]]; then
    # `ls` replacement
    zinit ice from"gh-r" as"program" pick"*/lsd"
    zinit light Peltoche/lsd
    # zinit light wrboyce/lsd

    # `cat` replacement
    zinit ice as"program" from"gh-r" pick"bat-*/bat"
    zinit light @sharkdp/bat
    # zinit light wrboyce/bat

    # `find` replacement
    zinit ice as"program" from"gh-r" pick"fd-*/fd"
    zinit light @sharkdp/fd

    # `grep` replacement
    zinit ice as"program" from"gh-r" pick"ripgrep-*/rg"
    zinit light BurntSushi/ripgrep

    # `diff replacement`
    zinit ice as"program" from"gh-r" pick"*/delta"
    zinit light dandavison/delta
    # zinit light wrboyce/delta

    # hex editor
    zinit ice as"program" from"gh-r" pick"hexyl-*/hexyl"
    zinit light @sharkdp/hexyl

    # json parser
    zinit ice as"program" from"gh-r" mv"jq-* -> jq"
    zinit light stedolan/jq

    if (( $+commands[git] )) && [ -f "${HOME}/.gitconfig" ]; then
        # zinit id-as"github/cli" as"program" from"gh-r" pick"gh" \
        #     for cli/cli
        zinit id-as"github/hub" as"program" from"gh-r" pick"hub-*/bin/hub" \
            for @github/hub
    fi
fi

## TODO: move this after binaries
if (( $+commands[lsd] )); then
    (( ! $TERM_IS_FANCY )) && _lsd_args="--icon=never"
    alias l="lsd -lhAF --date relative ${_lsd_args}"
    # zpcompdef l=lsd
fi
alias c='cat'
alias cn='cat -n'
if (( $+commands[bat] )); then
    export BAT_THEME="Solarized (dark)"
    alias b='bat'
    alias c='bat -p'
    alias ca='bat -p --pager=never'
    alias cn='bat -n'
fi
if (( $+commands[prettybat] )); then
    alias pc=prettybat
fi
if (( $+commands[batman] )); then
    alias man=batman
fi
