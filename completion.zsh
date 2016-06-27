zstyle -e ':completion:*:approximate:*'     max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions'         format "- %d -"
zstyle ':completion:*:corrections'          format "- %d - (errors %e})"
zstyle ':completion:*:default'              list-prompt '%S%M matches%s'                                    # scroll matches
zstyle ':completion:*'                      group-name ''                                                   # group all match types
zstyle ':completion:*'                      verbose yes                                                     # always use verbose form

# Do not complete things beginning with _
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:parameters' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns '_*'

# make completion work for aliases
setopt completealiases
