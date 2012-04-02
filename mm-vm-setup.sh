#!/usr/bin/env bash


if [[ ! `type curl 2>/dev/null` ]]; then
  echo "installing curl"
  sudo yum -y install curl
fi


if [[ ! `type git 2>/dev/null` ]]; then
  echo "installing git"
  sudo yum -y install git-all.noarch
fi

# install the dotfiles from github
source <(curl -s https://raw.github.com/andywiens/dotfiles/master/installer)

read -p "do you want to update the networking? (y/n): "
if [[ "$REPLY" = "y" ]]; then
	source <(curl -s https://raw.github.com/andywiens/mm-devvm-setup/master/mm-vm-networking-setup.sh)
fi

if [[ ! `type rvm 2>/dev/null` ]]; then
	read -p "Do you want to install RVM (y/n)?: "
	if [[ "$REPLY" = "y" ]]; then
        source <(curl -s https://raw.github.com/andywiens/mm-devvm-setup/master/mm-rvm-setup.sh)
	fi
fi
