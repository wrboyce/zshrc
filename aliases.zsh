# Super user
alias _='sudo'
alias ss='sudo -s'

# ZSH History
alias history='fc -il 1'

# nice `ls`
alias l='ls -lhAFv'

# syntax highlighting cat (colour cat)
(( $+commands[pygmentize] )) && alias c='pygmentize -g'
