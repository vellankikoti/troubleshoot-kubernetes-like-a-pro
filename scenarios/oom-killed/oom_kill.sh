#!/bin/bash
# Simulate OOMKilled by allocating excessive memory
echo "Starting memory allocation to trigger OOMKilled"
stress --vm 1 --vm-bytes 2G --timeout 30s
