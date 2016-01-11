# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"

plugins=(git sublime ssh-agent docker systemadmin aws sudo httpie)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/Users/ivan/workspace/utils

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	setxkbmap gb
	export GOPATH="$HOME/go"
elif [[ "$OSTYPE" == "darwin"* ]]; then

	export DOCKER_HOST=tcp://192.168.59.103:2376
	export DOCKER_CERT_PATH=/Users/ivan/.boot2docker/certs/boot2docker-vm
	export DOCKER_TLS_VERIFY=1

	export JAVA_HOME=$(/usr/libexec/java_home)
	export M2=`brew --prefix maven`/libexec/bin
	export M2_HOME=`brew --prefix maven`/libexec
 	export IO_HOME=/Applications/C24
fi


if [[ -d "/opt/android-studio" ]]; then
	export PATH=$PATH:/opt/android-studio/bin
	export ANDROID_HOME=/opt/android-studio
fi

if [[ -d "/opt/etcd" ]]; then
	export PATH=$PATH:/opt/etcd
fi

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions

source $HOME/dotfiles/z.sh

export LANG=en_GB.UTF-8


setxkbmap gb

#if [ -f ~/.rubyrc ]; then
#	source ~/.rubyrc;
#fi

if [ -f ~/.sshalias ]; then
	source ~/.sshalias
fi


export VISUAL=vim
export EDITOR="$VISUAL"


K=/opt/kubernetes/cluster

if [[ -d  $K ]]; then
	export PATH=$PATH:$K:
fi


if [ -f /home/ivan/.gvm/scripts/gvm ]; then
	source /home/ivan/.gvm/scripts/gvm
	gvm use go1.5.1
	export GOPATH="$HOME/go"
	export PATH=$PATH:/home/ivan/go/bin:
fi

export KUBERNETES_PROVIDER=aws;
