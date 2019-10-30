# when in `zshrc` mode, load `zdharma/zplugin` if it is available
# typeset -g ZPLG_MOD_DEBUG=1
# _load_zplmod() {
#     local zplmod_dir="${${(%):-%N}:A:h}/.zplugin/bin/zmodules/Src"
#     if [ -f "${zplmod_dir}/zdharma/zplugin.bundle" ]; then
#         module_path+=("${zplmod_dir}")
#         zmodload zdharma/zplugin
#     fi
# }
# [ "${${(%):-%N}:a:e}" = "zshrc" ] && _load_zplmod
# unset _load_zplmod

# compile first if necessary
zsource() {
    local cfg="$1" load="${2-true}"
    if (( ! $+modules[zdharma/zplugin] )) && [[ ! -s "${cfg}.zwc" || "${cfg}" -nt "${cfg}.zwc" ]]; then
        zcompile "$cfg"
    fi
    [ "${load}" = "true" ] && source "$cfg"
}

# source relevant files based on symlink name/destination (${link-dest-dir}/${link-src-ext}.d/**/*.zsh)
for cfg in "${${(%):-%N}:A:h}/${${(%):-%N}:a:e}.d/"**/*.zsh(N); do
    zsource "$cfg"
done
