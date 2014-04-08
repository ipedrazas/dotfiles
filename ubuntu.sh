sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install git vim zsh terminator curl virtualbox vagrant conky


curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh

# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &



