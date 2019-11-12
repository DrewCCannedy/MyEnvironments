#!/bin/bash
# setup linux environment with things I use

# is this for work or personal use?
echo "1) Work or 2) Personal: "
read work_or_personal
if [ $work_or_personal="1" ];
then
	email=drew.cannedy@respec.com
else
	email=dakillac@gmail.com
fi

sudo apt-get -y update
sudo apt -y install build-essential dkms

# vscode
wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo dpkg -i stable
rm stable

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# git 
sudo apt-get -y install git
git config --global user.name "Drew Cannedy"
git config --global user.email $email

# this file and its repo
mkdir Projects
cd Projects
git clone github.com/DrewCCannedy/MyEnvironments.git
cd ../

# python
sudo apt-get -y install python3

# java
sudo apt-get -y install default-jdk
java_path="$(readlink -f $(which java))"
java_path=${java_path%"bin/java"}
echo "JAVA_HOME=$java_path" | sudo tee -a /etc/environment 
source /etc/environment

# maven
sudo apt -y install maven

# node
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs

# cleanup
sudo apt-get -y install -f
sudo apt -y autoremove
echo -e "\nProcess Completed. Restart to apply path changes."

