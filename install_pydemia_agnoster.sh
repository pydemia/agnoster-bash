# mkdir -p $HOME/.bash/themes/agnoster-bash
theme_dir="$HOME/.bash/themes/agnoster-bash"

echo "Repository: 'https://github.com/pydemia/agnoster-bash'"

if [[ ! -e $theme_dir ]]; then
    if [[ ! -d $theme_dir ]]; then
        echo "$theme_dir already exists but is not a directory." 1>&2
    else
        echo "$theme_dir already exists."
    fi
else
    echo "Download 'agnoster-bash' to $theme_dir..."
    mkdir $theme_dir
fi

git clone https://github.com/pydemia/agnoster-bash.git $theme_dir

script_str="
# ----------------------------------------------------------
# Theme for bash: agnoster-bash
export THEME=$theme_dir/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi
# ----------------------------------------------------------

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
    echo "Append this to your shell profile:"
    echo "$script_str"
    echo "Done."
fi



