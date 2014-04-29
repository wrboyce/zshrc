# compiler flags
export ARCHFLAGS="-arch x86_64"

# mvim locally, vim when remote
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
