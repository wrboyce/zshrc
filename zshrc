# main settings
[ -x /usr/libexec/path_helper ] && eval $(/usr/libexec/path_helper -s)
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:${PATH}
[ -d /usr/local/sbin ] && export PATH=/usr/local/sbin:${PATH}
[ -d ${HOME}/.bin ] && export PATH=${HOME}/.bin:${PATH}
typeset -U PATH
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${HOME}/.oh-my-zsh-custom
# configuration
ZSH_THEME="wrboyce"
DEFAULT_USERNAME="wrboyce"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
DISABLE_VENV_CD=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
DISABLE_AUTO_UPDATE=true
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_ed25519
# plugins
plugins=(base16-shell django docker extract fabric fasd gitignore git-extras git-flow-avh golang httpie iterm nvm pep8 pip pylint python sudo sysadmin urltools vagrant virtualenv workenv zsh_reload zsh-syntax-highlighting)
(( $+commands[virtualenvwrapper.sh] )) && plugins=($plugins virtualenvwrapper)
[ -d "${HOME}/.gnupg" ] && plugins=($plugins gpg-agent)
if [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
    plugins=($plugins ssh-agent)
fi
if [[ $(uname -s) == "Darwin" ]]; then
    plugins=(osx $plugins brew copycmd fzf virtualbox)
elif [ -d /etc/apt ]; then
    plugins=($plugins debian ubuntu)
    grep -q 'DISTRIB_ID=Kali' /etc/lsb-release && plugins=($plugins kali)
elif [[ $(uname -s) == "FreeBSD" ]]; then
    plugins=($plugins freebsd)
    [ -f /cf/conf/config.xml ] && plugins=($plugins pfsense)
fi
# load oh-my-zsh
source $ZSH/oh-my-zsh.sh
