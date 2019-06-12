zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

if (( $+commands[fd] )); then
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
fi

zplugin ice svn multisrc='{completion,key-bindings}.zsh' id-as'junegunn/fzf-shell'
zplugin snippet https://github.com/junegunn/fzf/trunk/shell &>/dev/null
