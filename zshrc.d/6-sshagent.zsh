##


if [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
    return
fi

_ssh_env_cache="$HOME/.ssh/environment-${HOST/.*}"

_ssh::start_agent () {
    echo "Starting ssh-agent..."
    ssh-agent > "${_ssh_env_cache}"
    chmod 600 "${_ssh_env_cache}"
    zsource "${_ssh_env_cache}" &>/dev/null
    ssh-add -K
}

# setup ssh-agent if available
if (( $+commands[ssh-agent] )); then
    if [ -f "${_ssh_env_cache}" ]; then
        source "${_ssh_env_cache}" &>/dev/null
        ps -p ${SSH_AGENT_PID} &>/dev/null || _ssh::start_agent
    else
        _ssh::start_agent
    fi
fi