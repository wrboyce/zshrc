# extract function
zplugin ice svn wait'0' atinit'zpcompdef _extract x=extract' lucid
zplugin snippet OMZ::plugins/extract/

# double-tap escape to toggle sudo prefix
zplugin ice svn
zplugin snippet OMZ::plugins/sudo

# urlencode/urldecode functions
zplugin ice svn
zplugin snippet OMZ::plugins/urltools

# colourful `man` pages
zplugin ice svn
zplugin snippet OMZ::plugins/colored-man-pages

# django `manage.py` completion
zplugin ice svn
zplugin snippet OMZ::plugins/django

# `awscli` completion and helpers
if (( $+commands[aws] )); then
    zplugin ice svn
    zplugin snippet OMZ::plugins/aws
fi

if [ -r '/Applications/Dash.app' ]; then
    zplugin ice svn
    zplugin snippet OMZ::plugins/dash
fi

if [ -r '/Applications/Marked 2.app' ]; then
    zplugin ice svn
    zplugin snippet OMZ::plugins/marked2
fi
