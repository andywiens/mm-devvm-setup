#!/usr/bin/env bash

if [[ ! "root" = "$USER" ]]; then
	sudo su
fi

if [ ! `hash curl 2>&-` ]; then
  echo "installing curl"
  yum install curl
fi


if [ ! `hash git 2>&-` ]; then
  echo "installing git"
  yum install git-all.noarch
fi

# install the dotfiles from github
source <(curl -s https://raw.github.com/andywiens/dotfiles/master/installer)

read -p "do you want to update the networking? (y/n): "
if [[ "$REPLY" = "y" ]]; then
	source <(curl -s https://raw.github.com/andywiens/vm-install/master/mm-vm-setup.sh)
fi
