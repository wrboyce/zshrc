## initialise zinit


if [ ! -d "${ZDOTDIR-${HOME}}/.zinit" ]; then
    mkdir -p "${ZDOTDIR-${HOME}}/.zinit"
    git clone --quiet --recursive --single-branch https://github.com/zdharma/zinit.git "${ZDOTDIR-${HOME}}/.zinit/bin"
fi

source "${ZDOTDIR-${HOME}}/.zinit/bin/zinit.zsh"