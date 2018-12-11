md() {
	mkdir -p "$@" && cd "$_"
}

dataurl() {
	local file="$1"
	local mime_type=$(file -b --mime-type "$file")
	[[ $mime_type == text/* ]] && mime_type="${mime_type};charset=utf-8";
	echo "data:${mime_type};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

serve() {
	local port="${1:-8000}"
	local dir=${2:-${PWD}}
	(cd ${dir} && python3 -m http.server ${port})
}

extip() {
	dig +short myip.opendns.com @resolver1.opendns.com | tee >(xargs host)
}
