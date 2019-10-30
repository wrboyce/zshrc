## third party plugins


# fzf + git
zplugin ice wait lucid
zplugin load wfxr/forgit

# common command completions
zplugin ice as'completion'
zplugin load zsh-users/zsh-completions

# emoji-cli
EMOJI_CLI_KEYBIND='^e'
EMOJI_CLI_USE_EMOJI=1
zplugin load b4b4r07/emoji-cli

# docker
# zplugin ice silent pick'contrib/completion/zsh/_docker' id-as'docker-cli/zsh-completion' atinit'zpcompdef _docker docker'
# zplugin load docker/cli
zplugin ice svn silent as'completion' pick'_docker' id-as'docker-cli/zsh-completion'
zplugin snippet https://github.com/docker/cli/trunk/contrib/completion/zsh
# docker-compose
zplugin ice svn silent as'completion' pick'_docker-compose' id-as'docker-compose/zsh-completion'
zplugin snippet https://github.com/docker/compose/trunk/contrib/completion/zsh

# nvm
export NVM_LAZY_LOAD=true
zplugin ice wait'0' atload='unset bin cmd' lucid
zplugin load 'lukechilds/zsh-nvm'

## oh-my-zsh
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
    SHOW_AWS_PROMPT=false
    zplugin ice svn
    zplugin snippet OMZ::plugins/aws
fi

# `kubectl` completion
if (( $+commands[kubectl] )); then
    kubectl_cache="${ZSH_HOME}/cache/kubectl/init.zsh"
    mkdir -p "${kubectl_cache:h}" 2>/dev/null
    if [[ ! -s "${kubectl_cache}" || "${commands[kubectl]}" -nt "${kubectl_cache}" ]]; then
        # load everything but the aliases
        kubectl completion zsh >! "${kubectl_cache}"
    fi
    zsource "${kubectl_cache}" false
    zplugin ice id-as'kubectl/zsh-completion' pick'init.zsh'
    zplugin load "${kubectl_cache:h}"
    unset kubectl_cache
fi

if [ -r '/Applications/Dash.app' ]; then
    zplugin ice svn
    zplugin snippet OMZ::plugins/dash
fi

if [ -r '/Applications/Marked 2.app' ]; then
    zplugin ice svn
    zplugin snippet OMZ::plugins/marked2
fi

if [ "${LC_TERMINAL}" = "iTerm2" ]; then
    # iterm2 shell integration script
    zplugin ice id-as"iterm2-shell-integration"
    zplugin snippet https://iterm2.com/shell_integration/zsh

    # iterm2 shell integration utilities
    iterm2_utils=(imgcat imgls it2attention it2check it2copy it2dl it2getvar it2setcolor it2setkeylabel it2ul it2universion)
    for util in $iterm2_utils; do
        zplugin ice id-as"iterm2-shell-utils/${util}" wait"3" lucid as"program"
        zplugin snippet "https://iterm2.com/utilities/${util}"
    done
    unset iterm2_utils
fi