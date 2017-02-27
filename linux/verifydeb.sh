#!/bin/sh

PKG=$1
echo "Downloading clean package..."
sudo apt-get install --download-only --reinstall $PKG

echo
echo "Checking files..."
sudo debsums --generate=all --deb-path=/var/cache/apt/archives --changed $PKG
