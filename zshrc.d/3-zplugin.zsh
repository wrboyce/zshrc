## initialise zplugin


if [ ! -d "${ZDOTDIR-${HOME}}/.zplugin" ]; then
    mkdir -p "${ZDOTDIR-${HOME}}/.zplugin"
    git clone --quiet --recursive --single-branch https://github.com/zdharma/zplugin.git "${ZDOTDIR-${HOME}}/.zplugin/bin"
fi

source "${ZDOTDIR-${HOME}}/.zplugin/bin/zplugin.zsh"