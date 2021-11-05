## custom widgets and key-bindings


# wrap current commandline in a subshell
function _subshell-command-line {
    if [[ ! -z $BUFFER ]]
    then
        LBUFFER="(${BUFFER})"
    fi
}
zle -N _subshell-command-line
# bind to esc-s
bindkey "\es" _subshell-command-line

# vim-ish ^D should kill the rest of the line
bindkey "^D" kill-line

# TODO: add some more vim-like bindings for start/end of line