copy-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != echo\ * ]] && BUFFER=echo' "'$BUFFER'"'
    [[ $BUFFER != *pbcopy ]] && BUFFER="$BUFFER | pbcopy"
    zle end-of-line
}

zle -N copy-command-line
bindkey "\ec" copy-command-line
