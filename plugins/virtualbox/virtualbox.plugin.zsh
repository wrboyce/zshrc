mkvbox() {
    local name=$1
    local ram=${2-4096}
    local cpu=${3-2}
    local hd=${4-8192}
    local iface="$(VBoxManage list bridgedifs | head -1 | awk '{$1=""; print substr($0, 2)}')"
    VBoxManage createvm --name ${name} --ostype Ubuntu_64 --register
    VBoxManage modifyvm ${name} --memory ${ram} --cpus ${cpu} --nic1 bridged --bridgeadapter1 "${iface}" --audio none --vram 16 --boot1 disk --boot2 net --biosbootmenu disabled --rtcuseutc on
    VBoxManage storagectl ${name} --add sata --name SATA
    VBoxManage createhd --filename "${HOME}/VirtualBox VMs/${name}/${name}.vdi" --size ${hd} --variant Standard
    VBoxManage storageattach ${name} --storagectl SATA --port 0 --device 0 --type hdd --medium "${HOME}/VirtualBox VMs/${name}/${name}.vdi" --nonrotational on
    VBoxManage startvm ${name}
}
