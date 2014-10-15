# Install Oracle Java via APT
sudo add-apt-repository ppa:webupd8team/java -y


sudo apt-get update -y

# silent install Java 7
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

sudo apt-get -y install oracle-java7-installer oracle-java8-installer oracle-java6-installer



# oracle-java7-set-default oracle-java8-set-default

# set java 8 as default
sudo update-java-alternatives -s java-8-oracle

# set java 7 as default
sudo update-java-alternatives -s java-7-oracle

# set java 6 as default
# Java 6 is needed for developingwith Android
sudo update-java-alternatives -s java-6-oracle

