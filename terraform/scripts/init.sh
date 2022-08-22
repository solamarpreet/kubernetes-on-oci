#!/bin/sh

iptables -F
netfilter-persistent save
echo 'init successful' > /tmp/init.txt
echo 'APT::Get::Always-Include-Phased-Updates "1";' > /etc/apt/apt.conf.d/90phased-updates
