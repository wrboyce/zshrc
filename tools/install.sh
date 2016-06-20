#!/bin/sh

if [ -f ~/.zshrc ] || [ -d ~/.oh-my-zsh-custom ]; then
  echo "Previous (oh-my-)zsh config found at ~/.zshrc or ~/.oh-my-zsh-custom! Bailing..." >&2
  exit
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Cloning oh-my-zsh..."
  /usr/bin/env git clone --recursive --jobs=4 https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
fi
echo "Cloning oh-my-zsh-custom..."
/usr/bin/env git clone --recursive --jobs=4 https://github.com/wrboyce/oh-my-zsh-custom.git ${HOME}/.oh-my-zsh-custom

echo "Installing config..."
ln -s ~/.oh-my-zsh-custom/zshrc ~/.zshrc
