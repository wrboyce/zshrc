#export FZF_COMPLETION_OPTS="--preview 'if [[ -d '{}' ]]; then lsd -lhAF --date relative --icon=never --color=always {}; elif [[ \$(file --mime {}) =~ binary ]]; then echo {} is a binary file; elif [[ -f '{}' ]]; then (bat --style=numbers --color=always {} || cat {}) 2>/dev/null | head -500; fi'"

if (( $+commands[fd] )); then
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
fi

zinit ice multisrc='shell/{completion,key-bindings}.zsh' compile'shell/{completion,key-bindings}.zsh' id-as'junegunn/fzf-shell'
zinit load junegunn/fzf