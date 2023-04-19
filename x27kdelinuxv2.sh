#!/bin/bash

echo "Hello there, thanks for trying out my X27Linux distro! This script only works for Debian-based distros."

sleep 3

sudo apt update

sleep 1

sudo apt install nala -y

sleep 2
 
echo "Now Nala is going to be the new apt package manager from now on"

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

echo "Now we are going to enable the non-free packages (only tested on Debian-based distros)"

sleep 2

sudo dpkg --add-architecture i386

sleep 1

sudo nala install software-properties-common

sleep 1

sudo add-apt-repository non-free

sleep 5

echo "Downloading wallpaper..."

sleep 2

sudo wget https://r4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-d8b62d28c0f06c48d03c114ec8f2b4aa.jpg

sleep 1

echo "Installing Flatpak..."

sleep 2

sudo nala install flatpak

echo "Adding Flathub repository..."

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sleep 2

echo "Installing application using Flatpak..."

sudo flatpak install flathub com.example.App

sleep 2

sudo nala update && sudo nala upgrade -y

sleep 2

echo "Thanks for using this script :)"

sleep 3

echo "Please change the wallpaper and theme manually using the KDE settings."

sleep 10

sudo exit
