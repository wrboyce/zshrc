PLUGIN_DIR="${0%/*}"
source "${PLUGIN_DIR}/shell_integration.zsh"

function imgcat() {
  ${PLUGIN_DIR}/bin/imgcat $@
}

function it2dl() {
  ${PLUGIN_DIR}/bin/it2dl $@
}
