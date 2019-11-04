#!/bin/bash
# setup linux environment with things I use

echo "1) Work or 2) Personal: "
read work_or_personal
if [ $work_or_personal="1" ];
then
	email=drew.cannedy@respec.com
else
	email=dakillac@gmail.com
fi

sudo apt-get -y update

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

sudo apt-get -y install -f
sudo apt -y autoremove
echo -e "\nProcess Completed"
