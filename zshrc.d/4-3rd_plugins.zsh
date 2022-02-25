## third party plugins


# fzf + git
zinit ice wait lucid
zinit load wfxr/forgit

# common command completions
zinit ice as'completion'
zinit load zsh-users/zsh-completions

# emoji-cli
EMOJI_CLI_KEYBIND='^e'
EMOJI_CLI_USE_EMOJI=1
zinit load b4b4r07/emoji-cli

# nvm
export NVM_LAZY_LOAD=true
zinit ice wait'0' atload='unset bin cmd' lucid
zinit load 'lukechilds/zsh-nvm'

## oh-my-zsh
# extract function
zinit ice wait'0' atinit'zpcompdef _extract x=extract' lucid
zinit snippet OMZ::plugins/extract
zinit as=completion for OMZ::plugins/extract/_extract

# double-tap escape to toggle sudo prefix
zinit ice
zinit snippet OMZ::plugins/sudo

# urlencode/urldecode functions
zinit ice
zinit snippet OMZ::plugins/urltools

# colourful `man` pages
zinit ice
zinit snippet OMZ::plugins/colored-man-pages

# `awscli` completion and helpers
if (( $+commands[aws] )); then
    zinit ice has=aws
    zinit snippet OMZ::plugins/aws
fi

# `kubectl` completions
if (( $+commands[kubectl] )); then
    kubectl_cache="${ZSH_HOME}/cache/kubectl/init.zsh"
    [ -d "${kubectl_cache:h}" ] || mkdir -p "${kubectl_cache:h}" 2>/dev/null
    if [[ ! -s "${kubectl_cache}" || "${commands[kubectl]}" -nt "${kubectl_cache}" ]]; then
        kubectl completion zsh >! "${kubectl_cache}"
    fi
    zsource "${kubectl_cache}" false
    zinit ice id-as'kubectl/zsh-completion' pick'init.zsh'
    zinit load "${kubectl_cache:h}"
    unset kubectl_cache
fi

# `helm` completions
if (( $+commands[helm] )); then
    helm_cache="${ZSH_HOME}/cache/helm/init.zsh"
    [ -d "${helm_cache:h}" ] || mkdir -p "${helm_cache:h}" 2>/dev/null
    if [[ ! -s "${helm_cache}" || "${commands[helm]}" -nt "${helm_cache}" ]]; then
        helm completion zsh >! "${helm_cache}"
    fi
    zsource "${helm_cache}" false
    zinit ice id-as'helm/zsh-completion' pick'init.zsh'
    zinit load "${helm_cache:h}"
    unset helm_cache
fi

# `flux` completions
if (( $+commands[flux] )); then
    flux_cache="${ZSH_HOME}/cache/flux/init.zsh"
    [ -d "${flux_cache:h}" ] || mkdir -p "${flux_cache:h}" 2>/dev/null
    if [[ ! -s "${flux_cache}" || "${commands[flux]}" -nt "${flux_cache}" ]]; then
        flux completion zsh >! "${flux_cache}"
    fi
    zsource "${flux_cache}" false
    zinit ice id-as'flux/zsh-completion' pick'init.zsh'
    zinit load "${flux_cache:h}"
    unset flux_cache
fi

if [ -r '/Applications/Dash.app' ]; then
    zinit ice
    zinit snippet OMZ::plugins/dash
fi

if [ -r '/Applications/Marked 2.app' ]; then
    zinit ice
    zinit snippet OMZ::plugins/marked2
fi

if [ "${LC_TERMINAL}" = "iTerm2" ]; then
    # iterm2 shell integration script
    zinit ice id-as"iterm2-shell-integration"
    zinit snippet https://iterm2.com/shell_integration/zsh

    # iterm2 shell integration utilities
    iterm2_utils=(imgcat imgls it2attention it2check it2copy it2dl it2getvar it2setcolor it2setkeylabel it2ul it2universion)
    for util in $iterm2_utils; do
        zinit ice id-as"iterm2-shell-utils/${util}" wait"3" lucid as"program"
        zinit snippet "https://iterm2.com/utilities/${util}"
    done
    unset iterm2_utils
fi
