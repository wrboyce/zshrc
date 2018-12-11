if [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
    return
fi

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent ssh_add_args -K

zplugin ice svn wait'0' lucid; zplugin snippet OMZ::plugins/ssh-agent
