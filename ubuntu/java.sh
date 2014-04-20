# Install Oracle Java 7
sudo add-apt-repository ppa:webupd8team/java -y

# Install Oracle Java 8
sudo add-apt-repository ppa:webupd8team/java -y


sudo apt-get update -y

sudo apt-get install oracle-java7-installer oracle-java8-installer install oracle-java7-set-default install oracle-java8-set-default

# set java 8 as default
sudo update-java-alternatives -s java-8-oracle

# set java 7 as default
sudo update-java-alternatives -s java-7-oracle


