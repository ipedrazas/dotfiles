# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

plugins=(git vagrant sublime ssh-agent)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/ivan/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/go/bin


source $HOME/dotfiles/alias
source $HOME/dotfiles/functions

source $HOME/dotfiles/z.sh

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
