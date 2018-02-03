#!/bin/bash
#alternative
if [ -d /home/ubuntu/Logs ]
	then
	rm /home/ubuntu/Logs/AptGetLog
	else
	mkdir /home/ubuntu/Logs
fi
sudo apt-get update -qqy >> /home/ubuntu/Logs/AptGetLog
sudo apt-get upgrade -qqy >> /home/ubuntu/Logs/AptGetLog
echo "All up to date now!"

#install Java
#sudo add-apt-repository ppa:webupd8team/java >>/home/ubuntu/Logs/JavaInstall.log
#sudo apt-get update -qqy >> /home/ubuntu/Logs/JavaInstall-log
java -version

#install Maven
sudo mv mavenenv.sh /etc/profile.d/mavenenv.sh
sudo chmod +x /etc/profile.d/mavenenv.sh
sudo /etc/profile.d/mavenenv.sh 
source /etc/profile.d/mavenenv.sh

#Verify Maven installation
mvn --version
echo "Maven Installtion komplett"

#Download Petclinic resources
if [ -d /home/ubuntu/WWW ]
        then
        echo "WWW already exists"
        else
        mkdir /home/ubuntu/WWW
fi
if [ -d /home/ubuntu/WWW/Logs ]
        then
        echo "Logs already exists"
        else
        mkdir /home/ubuntu/WWW/Logs 
fi
cd /home/ubuntu/WWW
if [ -d /home/ubuntu/WWW/$1 ]
	then
	rm -rf /home/ubuntu/WWW/$1
fi
git clone https://github.com/mike1124/$1.git

#Start Pet-Clinic
cd $1
mvn spring-boot:run >> /home/ubuntu/WWW/Logs/$1.log &
echo "$1 starting..."