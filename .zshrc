# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ruhe"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# things
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
if [ -f $HOME/.zprofile ]; then
    source $HOME/.zprofile
fi

export EDITOR='emacs'
