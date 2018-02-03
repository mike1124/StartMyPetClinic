#!/bin/bash
cd /home/ubuntu
git clone https://github.com/mike1124/Builds.git
cd Builds/
cp ../WWW/MyPetClinic/target/*.jar $1/.
ls $1
git add *
git commit -m "Update $1 Build"
git push origin master
