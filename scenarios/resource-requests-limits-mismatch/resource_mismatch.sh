#!/bin/bash
# Simulate resource exhaustion by running a stress test
echo "Starting CPU and memory stress test to simulate resource mismatch"
stress --cpu 2 --vm 1 --vm-bytes 128M --timeout 30s
