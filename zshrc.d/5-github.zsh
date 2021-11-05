##


(( ! $+commands[hub] )) && return

zinit as'completion' id-as'github/hub-shell' mv'hub.zsh_completion -> _hub' pick'_hub' \
    for https://github.com/github/hub/blob/master/etc/hub.zsh_completion