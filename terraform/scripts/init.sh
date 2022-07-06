#!/bin/sh

iptables -F
netfilter-persistent save
echo "init successful" > /tmp/init.txt
