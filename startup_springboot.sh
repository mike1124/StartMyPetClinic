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

#install Open JDK Java
sudo apt-get install -qqy openjdk-8-jdk

#install Maven
sudo apt-get install -qqy maven

#Verify Maven installation
mvn --version
echo "Maven Installtion komplett"

#Download Petclinic resources
if [ -d /home/ubuntu/WWW ]
        then
        rm -rf /home/ubuntu/WWW
        else
        mkdir /home/ubuntu/WWW
fi
if [ -d /home/ubuntu/Logs ]
        then
        rm -rf /home/ubuntu/Logs
        else
        mkdir /home/ubuntu/Logs 
fi
cd /home/ubuntu/WWW
if [ -d /home/ubuntu/WWW/$1 ]
	then
	rm -rf /home/ubuntu/WWW/$1
fi
git clone https://github.com/mike1124/$1.git

#Create package
cd $1
mvn package
echo "$1 packed..."
