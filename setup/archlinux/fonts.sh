#!/bin/sh

echo "Installing fonts"

paru -S $(pacman -Ss ttf | grep -v ^" " | awk '{print $1}') --noconfirm --needed && fc-cache
paru -S noto-fonts-emoji --noconfirm --needed
paru -S noto-fonts otf-font-awesome ttf-ubuntu-font-family --noconfirm --needed
paru -S ttf-inconsolata --noconfirm --needed
paru -S ttf-hack ttf-iosevka-nerd --needed --noconfirm
paru -S ttf-fantasque-nerd --needed --noconfirm
fc-cache -v
