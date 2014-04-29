alias updatedb='sudo /usr/libexec/locate.updatedb'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

man-preview () {
    man -t "$@" | open -f -a Preview
}
alias manp=man-preview
compdef _man man-preview
