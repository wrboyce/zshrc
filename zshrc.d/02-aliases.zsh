# pretty-print $PATH
alias paths='echo -e ${PATH//:/\\n}'

# Super user
alias _='sudo'
alias ss='sudo -s'

# ZSH History
alias history='fc -il 1'

# nice `ls`
alias l='ls -lhAFvG'
# and a nice `tree`!
alias t='tree -FC'

# recursive git clone; think `git get`
alias gg='git clone --recursive'

# directory navigation
alias ..='cd ..'
alias cd='pushd -q'
alias dc='popd -q'

# syntax highlighting cat (colour cat)
(( $+commands[ccat] )) && alias c=ccat
(( $+commands[bat] )) && alias c='bat -p'

# remove ag alias for apt-get if silver searcher is installed
(( $+commands[ag] )) && unalias ag 2>/dev/null

# use `assh` wrapper if available
(( $+commands[assh] )) && alias ssh='assh wrapper ssh'

# use `ripgrep` over `silver-searcher` if available
(( $+commands[rg] )) && alias ag='_deprecate ag rg'

function _deprecate() {
  cmd=$1; shift
  echo 'WARNING: `'$cmd'` is deprecated, use `'$1'`' 2>/dev/null
  $@
}
