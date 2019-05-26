mkdir -p ~/.bash/themes/agnoster-bash
git clone https://github.com/pydemia/agnoster-bash.git ~/.bash/themes/agnoster-bash



script_str="
# Theme for bash: agnoster-bash
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi
"
# $SHELL, $OSTYPE, $(uname -s)
shell_name="$(basename $SHELL)"
if [[ shell_name == "zsh" ]]; then
    script_str >> ~/.zshrc
elif [[ shell_name == "bash" ]]; then
    script_str >> ~/.bashrc
    if [ shell_name != "root" ] && [ -f "~/.bash_profile" ]; then
        script_str >> ~/.bash_profile
    fi
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
#    script_str >> ~/.bash_profile
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
#    script_str >> ~/.bash_profile
# elif [[ "$OSTYPE" == "cygwin" ]]; then
#         # POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
#         # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
# elif [[ "$OSTYPE" == "win32" ]]; then
#         # I'm not sure this can happen.
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
#         # ...
else
    echo "append this to your shell profile:"
    echo script_str
    echo "Done."
fi



