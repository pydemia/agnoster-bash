mkdir -p ~/.bash/themes/agnoster-bash
git clone https://github.com/pydemia/agnoster-bash.git ~/.bash/themes/agnoster-bash

echo "
# Theme for bash: agnoster-bash
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi
" >> ~/.bashrc



