# main settings
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
plugins=(brew django docker extract fabric fasd github gitignore git-extras git-flow-avh npm npmbrew pip python ssh-agent sudo urltools vagrant virtualenv virtualenvwrapper zsh_reload zsh-syntax-highlighting)
if [[ $(uname -s) == "Darwin" ]]; then
    plugins=($plugins osx copycmd)
elif [[ ! -z $(cat /etc/issue 2>/dev/null | grep -Ei '(debian|ubuntu)') ]]; then
    plugins=($plugins debian)
fi
# load oh-my-zsh
source $ZSH/oh-my-zsh.sh
