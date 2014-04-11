
# vagrant and guestadditions nightmare
sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

sudo apt-get update -y && sudo apt-get upgrade -y


sudo apt-get install git vim zsh curl python-pip python-dev


curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh


pip install virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv ubuntu
