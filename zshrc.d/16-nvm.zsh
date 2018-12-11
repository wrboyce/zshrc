# if [ -d /usr/local/opt/nvm ]; then
    # zplugin ice wait'0' pick'nvm.sh' id-as'homebrew/nvm' lucid
    # zplugin load /usr/local/opt/nvm
# fi

export NVM_LAZY_LOAD=true
zplugin ice wait'0' lucid
zplugin load 'lukechilds/zsh-nvm'
