#!/bin/bash
# Simulate firewall restriction by blocking traffic
echo "Blocking all outgoing traffic to simulate firewall restrictions"
iptables -A OUTPUT -j DROP
