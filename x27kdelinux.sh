#!/bin/bash

echo "Hello there thanks for trying out my X27Linux distro only works for debian!"

sleep 3

sudo apt update

sleep 1

sudo apt install nala -y

sleep 2
 
echo "now nala is going to be the new apt package manager from now on"

sudo nala fetch

sleep 2

sudo nala update

sleep 2

sudo nala install preload neofetch

sleep 2

wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/materia-kde/master/install.sh | sh

sleep 1

wget -qO- https://git.io/papirus-icon-theme-install | sh

sleep 4

echo "now we are going to enable the non free packages and only tested on debian based distros"

sleep 2

sudo dpkg --add-architecture i386

sleep 1

sudo nala install software-properties-common
sleep 1
sudo add-apt-repository non-free

sleep 5

sudo wget https://r4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-d8b62d28c0f06c48d03c114ec8f2b4aa.jpg

sleep 1

sudo nala update && sudo nala upgrade -y


sleep 2

echo "Thanks for using this script:)"

sleep 3
echo "now the wallpaper will downloaded here you need to manualy"
echo "you also need to change to theme to the theme you downloaded on the kde settings"
sleep 10
sudo exit

