unfunction uninstall_oh_my_zsh
unfunction upgrade_oh_my_zsh

function upgrade_zshrc() {
  (cd ${ZSH}; git fetch origin master; git rebase --autostash --stat origin/master)
  (cd ${ZSH_CUSTOM}; git fetch origin master; git rebase --autostash --stat origin/master)
}

function get_ip() {
  local interface=$1
  ifconfig ${interface} | grep 'inet ' | awk '{print $2}'
}

function md() {
  mkdir -p "$@" && cd "$_"
}

function data_url() {
  local file="$1"
  local mime_type=$(file -b --mime-type "$file")
  [[ $mime_type == text/* ]] && mime_type="${mime_type};charset=utf-8";
  echo "data:${mime_type};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

function serve() {
  local port="${1:-8000}"
  local dir=${2:-${PWD}}
  (cd ${dir} && python3 -m http.server ${port})
}

function ext_ip() {
  dig +short myip.opendns.com @resolver1.opendns.com | tee >(xargs host)
}
