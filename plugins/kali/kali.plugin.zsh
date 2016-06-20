# add metasploit-framework tools to PATH
for d in $(find /usr/share/metasploit-framework/tools -mindepth 1 -type d); do
    export PATH=${d}:${PATH}
done
