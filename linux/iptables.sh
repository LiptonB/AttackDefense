#!/bin/sh

# Ubuntu
# sudo apt-get -y install iptables-persistent
# Fedora
# sudo dnf install -y iptables-services

sudo iptables -F
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Open a port for a service we provide
sudo iptables -A INPUT -p tcp -m conntrack --ctstate NEW --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m conntrack --ctstate ESTABLISHED --sport 22

# Open a port to access an outside service
sudo iptables -A OUTPUT -p udp --dport 53
sudo iptables -A OUTPUT -p tcp --dport 53

sudo iptables -A INPUT -j DROP
sudo iptables -A OUTPUT -j DROP


# Ubuntu
# sudo iptables-save >/etc/iptables/rules.v4
# sudo ip6tables-save >/etc/iptables/rules.v6
# Fedora
# sudo /usr/libexec/iptables/iptables.init save
