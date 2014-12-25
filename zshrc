# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"

plugins=(git vagrant sublime ssh-agent docker maven knife systemadmin)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:


source $HOME/dotfiles/alias
source $HOME/dotfiles/functions

source $HOME/dotfiles/z.sh

export LANG=en_GB.UTF-8


setxkbmap gb

if [ -f ~/.rubyrc ]; then 
	source ~/.rubyrc; 
fi

