## basic, global aliases that work pretty much everywhere


# pretty-print $PATH
alias paths='echo -e ${PATH//:/\\n} | cat -n'

# Super user
alias _='sudo'
alias ss='sudo -s'
alias apt-get='sudo apt'

# nice `ls`
alias ll='ls -lhAFvG'
# compdef ll=ls
# and a nice `tree`!
alias t='tree -FC'
# compdef t=tree

# recursive git clone; think `git get`
alias gg='git clone --recursive'
# compdef gg=git-clone