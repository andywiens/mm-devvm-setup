#!/usr/bin/env bash

if [[ ! "root" = "$USER" ]]; then
	echo "Unfortunately, you need to run this as root!"
	exit 10
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
	source <(curl -s https://raw.github.com/andywiens/mm-devvm-setup/master/mm-vm-networking-setup.sh)
fi

if [ ! `hash rvm 2>&-` ]; then
	read -p "Do you want to install RVM (y/n)?: "
	if [[ "$REPLY" = "y" ]]; then
		bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
	fi
fi
