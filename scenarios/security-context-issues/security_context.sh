#!/bin/bash
# Simulate security context violation by running as a privileged user
echo "Simulating security context issue"
chmod 777 /root
