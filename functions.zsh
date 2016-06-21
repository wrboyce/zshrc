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
