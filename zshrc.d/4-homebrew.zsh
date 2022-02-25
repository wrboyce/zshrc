# cache init script as to avoid binary execution
brew_cache="${ZSH_HOME}/cache/brew/env.zsh"
mkdir -p "${brew_cache:h}" 2>/dev/null
if [[ ! -s "${brew_cache}" || "${commands[brew]}" -nt "${brew_cache}" ]]; then
    brew shellenv >! "${brew_cache}"
fi
zsource "${brew_cache}" false
zinit ice id-as'homebrew/env' pick'env.zsh' compile'env.zsh'
zinit load "${brew_cache:h}"
unset brew_cache

# load completions
zinit as=completion id-as=homebrew/completions for "/opt/homebrew/share/zsh/site-functions"