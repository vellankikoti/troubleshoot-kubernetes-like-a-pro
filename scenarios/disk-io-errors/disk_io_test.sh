#!/bin/bash
# Simulate disk IO errors by writing large files until the disk is full
echo "Filling disk space to simulate disk IO errors"
dd if=/dev/zero of=/tmp/largefile bs=1M count=10240
