# Super user
alias _='sudo'
alias ss='sudo -s'

# ZSH History
alias history='fc -il 1'

# nice `ls`
alias l='ls -lhAFv'

# syntax highlighting cat
(( $+commands[pygmentize] )) && alias cat='pygmentize -g'
