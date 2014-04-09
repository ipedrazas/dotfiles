sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install ubuntu-restricted-extras

sudo apt-get install git vim zsh terminator curl virtualbox vagrant conky vlc chromium-browser flashplugin-installer unity-tweak-tool dropbox samba system-config-samba cifs-utils winbind hotot

curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh


sh ubuntu/sublime-install.sh
# sh ubuntu/dropbox-install.sh

gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"


