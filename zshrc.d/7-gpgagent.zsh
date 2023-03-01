##


if (( ! $+commands[gpg-agent] )) || [ ! -d "${HOME}/.gnupg" ]; then
    return
fi

#zinit ice wait'0' lucid
#zinit snippet OMZ::plugins/gpg-agent
