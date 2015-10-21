sudo apt-get update -y && sudo apt-get upgrade -y


# restricted
sudo apt-get install ubuntu-restricted-extras -y

sudo apt-get install git vim vim-athena zsh htop terminator curl cifs-utils winbind network-manager-openvpn -y

# Install build
sudo apt-get install build-essential module-assistant checkinstall cdbs devscripts dh-make fakeroot libxml-parser-perl check -y

# Disable lens
sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video -y

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb
sudo dpkg -i google-chrome-beta_current_amd64.deb

curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh


sh ubuntu/sublime-install.sh
# sh ubuntu/dropbox-install.sh

gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# hermit fonts
wget https://pcaro.es/d/otf-hermit-1.21.tar.gz
tar -xzf otf-hermit-1.21.tar.gz
sudo mv *.otf /usr/share/fonts
rm otf-hermit-1.21.tar.gz

echo "setxkbmap gb" >> ~/.zshrc
