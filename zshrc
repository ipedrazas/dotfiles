# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"

plugins=(git vagrant sublime ssh-agent docker maven knife)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/go/bin:/home/ivan/android/sdk/tools:


source $HOME/dotfiles/alias
source $HOME/dotfiles/functions

source $HOME/dotfiles/z.sh

export LANG=en_GB.UTF-8

export GOPATH=$HOME/go

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

source $HOME/.awsip

setxkbmap gb
