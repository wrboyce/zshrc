## 


if (( ! $+commands[gpg-agent] )) || [ ! -d "${HOME}/.gnupg" ]; then
    return
fi

zinit ice svn wait'0' lucid
zinit snippet OMZ::plugins/gpg-agent