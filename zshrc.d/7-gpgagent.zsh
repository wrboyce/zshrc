## 


if (( ! $+commands[gpg-agent] )) || [ ! -d "${HOME}/.gnupg" ]; then
    return
fi

zplugin ice svn wait'0' lucid
zplugin snippet OMZ::plugins/gpg-agent