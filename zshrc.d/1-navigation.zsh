## anything and everything related to moving between directories


# navigation options
setopt autocd  # cd into a directory if it is "executed"
setopt autopushd # automatically push entered directories to stack
setopt cdablevars # follow `~...` filename expansion in with `cd`/`autocd`
setopt pushdignoredups # but don't push dupes to directory stack
setopt pushdtohome # no arguments -> `pushd ~`

# navigation aliases
alias cd='pushd -q'
alias dc='popd -q'

## named directories
# ~dev -- code
if [ -d "${HOME}/Dev" ]; then
    hash -d dev="${HOME}/Dev"
elif [ -d "${HOME}/dev" ]; then
    hash -d dev="${HOME}/dev"
fi
# ~dl -- downloads
if [ -d "${HOME}/Downloads" ]; then
    hash -d dl="${HOME}/Downloads"
elif [ -d "${HOME}/downloads" ]; then
    hash -d dl="${HOME}/downloads"
fi
# ~tmp -- temporary
if [ -n "${TMPDIR}" ]; then
    hash -d tmp="${TMPDIR}"
elif [ -d "${HOME}/.tmp" ]; then
    hash -d tmp="${HOME}/.tmp"
elif [ -d "/tmp" ]; then
    hash -d tmp="/tmp"
fi

# move into a directory, creating structure necessary if necessary
md() {
	mkdir -p "$@" && cd "$_"
}