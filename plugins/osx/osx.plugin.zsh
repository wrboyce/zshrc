alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias pfctl='sudo pfctl'

man-preview() {
    man -t "$@" | open -f -a Preview
}
alias manp=man-preview
compdef _man man-preview
