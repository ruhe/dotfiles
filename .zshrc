export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [ -f $HOME/.zprofile ]; then
    source $HOME/.zprofile
fi
