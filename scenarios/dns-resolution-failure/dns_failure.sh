#!/bin/bash
# Simulate DNS resolution failure by overriding resolv.conf
echo "Simulating DNS resolution failure"
echo "nameserver 0.0.0.0" > /etc/resolv.conf
nginx -g "daemon off;"
