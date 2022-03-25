typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_with_package_name
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    smart_context
    workenv
    direnv
    dir
    vcs
)

typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|terraform'

typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|flux'

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  aws
  terraform
  kubecontext
)

if (( $TERM_IS_FANCY )); then
    typeset -g POWERLEVEL9K_MODE=nerdfont-complete
else
    typeset -g POWERLEVEL9K_MODE=powerline
fi