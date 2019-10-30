## history related settings


# TODO: persist history to remote storage if Dropbox/iCloud/nextCloud/etc available?
[ -z "$HISTFILE" ] && HISTFILE="${HOME}/.zsh_history"
HISTSIZE=65536
SAVEHIST=16384

setopt extendedhistory  #
setopt histexpiredupsfirst  #
setopt histfindnodups  #
setopt histignorealldups  #
setopt histignoredups  #
setopt histignorespace  #
setopt histreduceblanks  #
setopt histsavenodups  #
setopt histverify  # expand and show command before executing
setopt sharehistory  #

# `history` alias
alias history='fc -il 1'