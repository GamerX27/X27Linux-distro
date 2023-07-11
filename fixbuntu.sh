#!/bin/bash

# Remove snapd
sudo apt remove --autoremove snapd

# Create a preferences file to prevent snapd installation
echo '# To prevent repository packages from triggering the installation of snap,
# this file forbids snapd from being installed by APT.

Package: snapd
Pin: release a=*
Pin-Priority: -10' | sudo tee /etc/apt/preferences.d/nosnap.pref

# Update package information
sudo apt update

# Install gnome-core
sudo apt install gnome-core

# Add Mozilla Firefox PPA
sudo add-apt-repository ppa:mozillateam/ppa

# Create preferences file for Mozilla Firefox
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

# Configure unattended upgrades for Mozilla Firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

# Update package information
sudo apt update

# Install Firefox
sudo apt install firefox

# Install Flatpak
sudo apt install flatpak

# Install GNOME Software plugin for Flatpak
sudo apt install gnome-software-plugin-flatpak

# Add Flathub remote repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Pause and wait for user input
read -p "Press Enter to upgrade the system..."

# Upgrade the system
sudo apt upgrade -y

# Output "Done!" in green
echo -e "\e[32mDone!\e[0m"
