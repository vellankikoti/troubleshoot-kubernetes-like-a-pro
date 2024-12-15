#!/bin/bash
# Simulate SELinux/AppArmor policy violation by attempting unauthorized access
echo "Simulating SELinux violation"
touch /root/forbidden_file
