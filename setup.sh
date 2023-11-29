#!/bin/bash

# these are the commands for to make th dnf fast and downloads faster
sudo sh -c 'echo "fastestmirror=True" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "max_parallel_downloads=3" >>/etc/dnf/dnf.conf'
sudo sh -c 'echo "keepcache=True" >>/etc/dnf/dnf.conf'

# changing the lid settings so that the computer will power off when the lid is closed
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=poweroff/g' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=poweroff/g' /etc/systemd/logind.conf

# change the host namee to Heaphaestus
sudo hostnamectl set-hostname hepheastus

# change the wallpaper
gsettings set org.gnome.desktop.background picture-uri file:./stars.png

# update system
sudo dnf update
sudo dnf upgrade --refresh

# enable RPM fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# adding flatback
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# installing gnome tweaks
sudo dnf install gnome-tweaks

# install brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# install vscode
flatpak install flathub com.visualstudio.code

# install obsidian
flatpak install flathub md.obsidian.Obsidian

# install spotify
flatpak install flathub com.spotify.Client

# installing discord
sudo dnf install discord

# installing vlc media player
sudo dnf install vlc
sudo dnf install python-vlc npapi-vlc

# install git
sudo dnf install git

# install qbittorrent
sudo dnf install qbittorrent -y