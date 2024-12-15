#!/bin/bash
# Fill disk space to simulate a crash due to insufficient disk space
echo "Simulating crash by filling up the disk space"
dd if=/dev/zero of=/var/tmp/largefile bs=1M count=10240
