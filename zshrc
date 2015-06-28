# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"

plugins=(git vagrant sublime ssh-agent docker mvn knife systemadmin aws sudo)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/Users/ivan/workspace/utils:


source $HOME/dotfiles/alias
source $HOME/dotfiles/functions

source $HOME/dotfiles/z.sh

export LANG=en_GB.UTF-8


#setxkbmap gb

if [ -f ~/.rubyrc ]; then 
	source ~/.rubyrc; 
fi

if [ -f ~/.sshalias ]; then
	source ~/.sshalias
fi

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=/home/ivan/workspace/lab/golab/heartbeat


export VISUAL=vim
export EDITOR="$VISUAL"


if [[ "$OSTYPE" == "linux-gnu" ]]; then
				setxkbmap gb
elif [[ "$OSTYPE" == "darwin"* ]]; then

	export DOCKER_HOST=tcp://192.168.59.103:2376
	export DOCKER_CERT_PATH=/Users/ivan/.boot2docker/certs/boot2docker-vm
	export DOCKER_TLS_VERIFY=1


	export JAVA_HOME=$(/usr/libexec/java_home)
	export M2=`brew --prefix maven`/libexec/bin
	export M2_HOME=`brew --prefix maven`/libexec

fi

K=/home/ivan/workspace/lab/kubernetes/kubernetes/kubernetes/cluster/

if [[ -d  $K ]]; then
				export PATH=$PAH:$K:
fi
