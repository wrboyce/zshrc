## misc utility functions that don't fit anywhere else


# encode specified file as `data:...` 
dataurl() {
	local file="$1" mime_type
	mime_type=$(file -b --mime-type "$file")
	[[ $mime_type == text/* ]] && mime_type="${mime_type};charset=utf-8"
	echo "data:${mime_type};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# serve files in specified dir or cwd via http
serve() {
	local dir=${1:-${PWD}} port="$2"

	(cd ${dir} && python3 -m http.server ${port})
}

# create a virtual machine in VirtualBox and network boot it
mkvbox () {
	local name=$1 ram=${2-4096} cpu=${3-2} hd=${4-8192} 
	if [ -z "${name}" ]; then
		echo >&2 "USAGE: $0 <name> [ram=4096] [cpu=2] [hd=8192]"
		return 2
	fi

	(
		set -eu
		local iface="$(VBoxManage list bridgedifs | head -1 | awk '{$1=""; print substr($0, 2)}')" 
		VBoxManage createvm --name ${name} --ostype Ubuntu_64 --register
		VBoxManage modifyvm ${name} --memory ${ram} --cpus ${cpu} --nic1 bridged --bridgeadapter1 "${iface}" --audio none --vram 16 --boot1 disk --boot2 net --biosbootmenu disabled --rtcuseutc on
		VBoxManage storagectl ${name} --add sata --name SATA
		VBoxManage createhd --filename "${HOME}/VirtualBox VMs/${name}/${name}.vdi" --size ${hd} --variant Standard
		VBoxManage storageattach ${name} --storagectl SATA --port 0 --device 0 --type hdd --medium "${HOME}/VirtualBox VMs/${name}/${name}.vdi" --nonrotational on
		VBoxManage startvm ${name}
	)
}