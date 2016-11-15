# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ruhe-bw"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# things
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
if [ -f $HOME/.zprofile ]; then
    source $HOME/.zprofile
fi

export EDITOR='emacs'
