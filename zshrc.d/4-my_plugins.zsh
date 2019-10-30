## my external stuff


my_plugins=(zsh-workenv)
for plg in $my_plugins; do
	zplugin ice id-as"wrboyce/${plg}"
	if [ -d "${HOME}/Dev/${plg}" ]; then
		zplugin load "${HOME}/Dev/${plg}"
	else
		zplugin load "wrboyce/${plg}"
	fi
done