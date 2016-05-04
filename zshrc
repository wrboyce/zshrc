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
# plugins
plugins=(django docker extract fabric fasd gitignore git-extras git-flow-avh httpie nvm pep8 pip pylint python sudo sysadmin urltools vagrant virtualenv zsh_reload zsh-syntax-highlighting)
(( $+commands[virtualenvwrapper.sh] )) && plugins=($plugins virtualenvwrapper)
# [ -d "${HOME}/.gnupg" ] && plugins=($plugins gpg-agent)
if [[ $(uname -s) == "Darwin" ]]; then
    plugins=(osx $plugins brew copycmd tuntaposx virtualbox)
elif [ -d /etc/apt ]; then
    plugins=($plugins debian ubuntu)
elif [[ $(uname -s) == "FreeBSD" ]]; then
    plugins=($plugins freebsd)
    [ -f /cf/conf/config.xml ] && plugins=($plugins pfsense)
fi
# load oh-my-zsh
source $ZSH/oh-my-zsh.sh
