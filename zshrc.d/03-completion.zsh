setopt automenu
setopt autoparamslash
setopt autoremoveslash
setopt alwaystoend
setopt completealiases
setopt completeinword

zstyle ':completion:*' group-name ''  # group all match types
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'  # case insensitive matching
zstyle ':completion:*' rehash true  # find new binaries in PATH automatically
zstyle ':completion:*' special-dirs true  # complete . and .. dirs
zstyle ':completion:*:*:*:*:*' menu select  # show autocomplete menu

zstyle ':completion:*' list-colors ''  # ??

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion::complete:*' use-cache 1
# zstyle ':completion::complete:*' cache-path TODO

zstyle -e ':completion:*:approximate:*'     max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions'         format "- %d -"
zstyle ':completion:*:corrections'          format "- %d - (errors %e})"
zstyle ':completion:*:default'              list-prompt '%S%M matches%s'                                    # scroll matches
zstyle ':completion:*'                      verbose yes                                                     # always use verbose form

# Do not complete things beginning with _
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:parameters' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns '_*'
