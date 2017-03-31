bindkey -s '\el' 'l\n'      # [Esc-l] - run command: l
bindkey ' ' self-insert     # get rid of magic-space

function _subshell-command-line {
    if [[ ! -z $BUFFER ]]
    then
        LBUFFER="(${BUFFER})"
    fi
}
zle -N _subshell-command-line
bindkey "\es" _subshell-command-line
