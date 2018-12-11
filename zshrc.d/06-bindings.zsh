function _subshell-command-line {
    if [[ ! -z $BUFFER ]]
    then
        LBUFFER="(${BUFFER})"
    fi
}
zle -N _subshell-command-line
bindkey "\es" _subshell-command-line
