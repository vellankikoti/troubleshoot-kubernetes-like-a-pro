#!/bin/bash
# Simulate insufficient resources by overallocating CPU
echo "Simulating CPU resource exhaustion"
stress --cpu 4 --timeout 30s
