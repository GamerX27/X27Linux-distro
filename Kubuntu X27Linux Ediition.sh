#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Hello there, thanks for trying out my X27Linux distro! This script only works for Debian-based distros.${NC}"

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

echo -e "${GREEN}Installing Materia and Papirus themes...${NC}"

sleep 2

sudo apt install materia-kde papirus-icon-theme -y

sleep 4

echo -e "${GREEN}Applying Materia and Papirus icon themes...${NC}"

mkdir -p ~/.local/share/plasma/desktoptheme/
mkdir -p ~/.local/share/plasma/look-and-feel/
mkdir -p ~/.local/share/icons/

cp -r /usr/share/themes/Materia* ~/.local/share/plasma/desktoptheme/
cp -r /usr/share/plasma/look-and-feel/org.kde.breeze.desktop ~/.local/share/plasma/look-and-feel/
cp -r /usr/share/icons/Papirus* ~/.local/share/icons/

echo "Done!"

sleep 2

echo -e "${GREEN}Installing Flatpak...${NC}"

sleep 2

sudo apt install flatpak -y

echo -e "${GREEN}Adding Flathub repository...${NC}"

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "${GREEN}Installing Plasma Discover backend for Flatpak...${NC}"

sudo nala install plasma-discover-backend-flatpak

sleep 2

cd ~/Downloads/

echo -e "${GREEN}Downloading wallpaper...${NC}"

sleep 2

sudo wget https://r4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-d8b62d28c0f06c48d03c114ec8f2b4aa.jpg

echo -e "${GREEN}Applying wallpaper...${NC}"

gsettings set org.kde.desktop.background picture-uri "file://$HOME/Downloads/d8b62d28c0f06c48d03c114ec8f2b4aa.jpg"

sleep 1

echo -e "${GREEN}Thanks for using this script :)${NC}"

sleep 3

echo -e "${GREEN}Please change the wallpaper and theme manually using the KDE settings.${NC}"

sleep 10

exit
