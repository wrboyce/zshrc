## my external stuff


my_plugins=(zsh-workenv)
for plg in $my_plugins; do
	zinit ice id-as"wrboyce/${plg}"
	if [ -d "${HOME}/Dev/${plg}" ]; then
		zinit load "${HOME}/Dev/${plg}"
	else
		zinit load "wrboyce/${plg}"
	fi
done