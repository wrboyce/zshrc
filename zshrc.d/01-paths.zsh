function _order_path() {
    local home_paths=()
    local global_paths=()
    local part
    for part in $path; do
        if [[ "$part" == "${HOME}"* ]]; then
            home_paths=($home_paths $part)
        else
            global_paths=($global_paths $part)
        fi
    done
    path=($home_paths $global_paths)
}

[ -x /usr/libexec/path_helper ] && eval $(/usr/libexec/path_helper -s)
[ -d /usr/local/bin ] && export PATH=/usr/local/bin:${PATH}
[ -d /usr/local/sbin ] && export PATH=/usr/local/sbin:${PATH}
[ -d ${HOME}/.bin ] && export PATH=${HOME}/.bin:${PATH}
[ -d ${HOME}/.cargo/bin ] && export PATH=${HOME}/.cargo/bin:${PATH}

_order_path
