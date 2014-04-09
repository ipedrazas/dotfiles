sudo apt-get update -y && sudo apt-get upgrade -y


# restricted
sudo apt-get install ubuntu-restricted-extras

sudo apt-get install git vim zsh terminator curl virtualbox vagrant conky vlc chromium-browser flashplugin-installer unity-tweak-tool dropbox samba system-config-samba cifs-utils winbind hotot

# Install build
sudo apt-get install build-essential module-assistant virtualbox-guest-additions checkinstall cdbs devscripts dh-make fakeroot libxml-parser-perl check

# Disable lens
sudo apt-get autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video

#  codecs
sudo apt-get install libxine1-ffmpeg gxine mencoder mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 ffmpeg totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 libjpeg-progs flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview flac libmpeg3-1 mpeg3-utils mpegdemux liba52-0.7.4-dev libquicktime2


curl -L http://install.ohmyz.sh | sh
chsh -s /bin/zsh


sh ubuntu/sublime-install.sh
# sh ubuntu/dropbox-install.sh

gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"


