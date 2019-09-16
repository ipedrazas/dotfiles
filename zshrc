# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"

#plugins=(git ssh-agent docker systemadmin aws sudo httpie)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/Users/ivan/workspace/utils

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions


export LANG=en_GB.UTF-8

setxkbmap gb

if [ -f ~/.sshalias ]; then
	source ~/.sshalias
fi


export VISUAL=vim
export EDITOR="$VISUAL"


export WIFIIP=$(ip addr | awk '/inet/ && /wlan0/{sub(/\/.*$/,"",$2); print $2}')
export GOPATH=$HOME/workspace/go

export PATH=$PATH:$GOPATH/bin:/snap/bin/go

# initssh

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#source $HOME/dotfiles/51_prompt.sh
source $HOME/dotfiles/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

PS1="\`if [ \$? = 0 ]; then echo 😄; else echo 😡; fi\`  ${PS1} "

export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_CTX_COLOR=blue
export KUBE_PS1_SUFFIX=]
export KUBE_PS1_SUFFIX="] "



