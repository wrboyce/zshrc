#!/usr/bin/env zsh
set -eu

ZDOTDIR=${ZDOTDIR-${HOME}}

if [ -f "${ZDOTDIR}/.zshenv" ] || [ -f "${ZDOTDIR}/.zshrc" ] || [ -d "${ZDOTDIR}/.zsh" ]; then
  echo "ERROR: Previous zsh config found at ${ZDOTDIR}/.zshenv, ${ZDOTDIR}/.zshrc, or ${ZDOTDIR}/.zsh! Bailing..." >&2
  exit 1
fi

required_commands=(git svn)
for cmd in "${required_commands[@]}"; do
  if ! (( ${+commands[${cmd}]} )); then
    echo 'ERROR: Cannot find `'"${cmd}"'` binary in PATH' >&2
    exit 1
  fi
done
unset required_commands

wanted_commands=(fasd fzf)
for cmd in "${wanted_commands[@]}"; do
  if ! (( ${+commands[${cmd}]} )); then
    echo 'WARNING: Cannot find `'"${cmd}"'` binary in PATH' >&2
  fi
done
unset wanted_commands

echo '==> Cloning zsh config...'
git clone --quiet --recursive https://github.com/wrboyce/oh-my-zsh-custom.git "${ZDOTDIR}/.zsh"

echo '==> Activating config...'
ln -sv "${ZDOTDIR}/.zsh/zshenv" "${ZDOTDIR}/.zshenv"
ln -sv "${ZDOTDIR}/.zsh/zshrc" "${ZDOTDIR}/.zshrc"
