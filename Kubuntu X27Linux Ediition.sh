#!/bin/bash

echo "Hello there, thanks for trying out my X27Linux distro! This script only works for this is for Kubuntu based maybe kde neon."

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

echo "Installing Materia theme..."

sleep 2

sudo apt install materia-kde -y

sleep 2

echo "Installing Papirus icon theme..."

wget -qO- https://git.io/papirus-icon-theme-install | sh

sleep 4

echo "Installing Flatpak..."

sleep 2

sudo apt install flatpak -y

echo "Adding Flathub repository..."

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing Plasma Discover backend for Flatpak..."

sudo nala install plasma-discover-backend-flatpak

sleep 2

sudo nala update && sudo nala upgrade -y

sleep 2

echo "Thanks for using this script :)"

sleep 3

echo "Please change the wallpaper and theme manually using the KDE settings."

sleep 10

exit
