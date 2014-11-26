sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update -y
sudo apt-get install sublime-text-installer -y


cd ~/.config/sublime-text-3/Packages
rm -Rf User
git clone git@github.com:ipedrazas/sublimetext-settings.git User
