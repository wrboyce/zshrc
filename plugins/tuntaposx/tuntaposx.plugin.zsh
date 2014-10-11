tapcfg() {
    local tapN=$1
    local ip=$(whatmask $2 | grep 'IP Entered =' | awk '{print $(NF)}')
    local mask=$(whatmask $2 | grep 'Netmask =' | awk '{print $(NF)}')
    local gw=$3
    shift; shift; shift
    sudo ifconfig tap${tapN} ${ip} ${mask} up
    echo "tap${tapN}: ${ip}/${mask}"
    for subnet in $*; do
        sudo route add ${subnet} ${gw}
    done
}
