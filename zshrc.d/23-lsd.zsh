zplugin ice from"gh-r" as"program" mv"*/lsd -> lsd"
zplugin load Peltoche/lsd
(( $+commands[lsd] )) && alias l='lsd -lhAF --date relative'
