#!/usr/bin/env bash
log()  { printf "$*\n" ; return $? ;  }

if [[ -e /etc/udev/rules.d/70-persistent-net.rules ]]; then
	sudo rm /etc/udev/rules.d/70-persistent-net.rules
fi

# ask user what the vm should be called
read -p "What do you want this vm to be called?: " vmname

# update /etc/hostname with name
log "changing hostname to '$vmname'"
cat /etc/sysconfig/network | grep -v HOSTNAME > ~/tmp-network
echo "HOSTNAME=$vmname" >> ~/tmp-network
sudo mv ~/tmp-network /etc/sysconfig/network

read -p "What do you want the IP to be?: " newip
echo "changing ip to '$newip'"
echo -e "DEVICE=eth1\nIPADDR=$newip\nBROADCAST=192.168.56.255\nNETWORK=192.168.56.1\nNETMASK=255.255.255.0\nONBOOT=yes\nBOOTPROTO=none\nTYPE=Ethernet\nUSERCTL=no\nPEERDNS=yes\nIPV6INIT=no" > ~/tmp/ifcfg-eth1
sudo mv ~/tmp/ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-eth1
