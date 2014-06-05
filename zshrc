# main settings
[ -x /usr/libexec/path_helper ] && eval $(/usr/libexec/path_helper -s)
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:${PATH}
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
# plugins
plugins=(django docker extract fabric fasd github gitignore git-extras git-flow-avh npm pip python ssh-agent sudo urltools vagrant virtualenv zsh_reload zsh-syntax-highlighting)
command virtualenvwrapper.sh 2>/dev/null && plugins=($plugins virtualenvwrapper)
if [[ $(uname -s) == "Darwin" ]]; then
    plugins=(osx $plugins brew npmbrew copycmd)
elif [[ ! -z $(cat /etc/issue 2>/dev/null | grep -Ei '(debian|ubuntu)') ]]; then
    plugins=($plugins debian)
fi
# load oh-my-zsh
source $ZSH/oh-my-zsh.sh
