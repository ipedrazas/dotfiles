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
	#export ANDROID_HOME=/opt/android-studio
	export ANDROID_HOME=~/Android/Sdk
	export PATH=$PATH:/opt/android-studio/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi


if [[ -d "/opt/etcd" ]]; then
	export PATH=$PATH:/opt/etcd
fi

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions

source $HOME/dotfiles/z.sh

export LANG=en_GB.UTF-8


setxkbmap gb


if [ -f ~/.sshalias ]; then
	source ~/.sshalias
fi


export VISUAL=vim
export EDITOR="$VISUAL"

if [ -f /home/ivan/.gvm/scripts/gvm ]; then
	source /home/ivan/.gvm/scripts/gvm
	gvm use go1.6
	export GOPATH="$HOME/go"
	export PATH=$PATH:/home/ivan/go/bin:
fi


# The next line updates PATH for the Google Cloud SDK.
source '/home/ivan/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/ivan/google-cloud-sdk/completion.zsh.inc'


export WIFIIP=$(ip addr | awk '/inet/ && /wlan0/{sub(/\/.*$/,"",$2); print $2}')

# initssh
