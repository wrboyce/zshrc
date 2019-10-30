##


(( ! $+commands[hub] )) && return

zplugin ice svn as'completion' id-as'github/hub-shell' cp'hub.zsh_completion -> _hub' pick'_hub'
zplugin snippet https://github.com/github/hub/trunk/etc