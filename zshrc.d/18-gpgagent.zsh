[ ! -d "${HOME}/.gpg" ] && return

zplugin ice svn wait'0' lucid; zplugin snippet OMZ::plugins/gpg-agent
