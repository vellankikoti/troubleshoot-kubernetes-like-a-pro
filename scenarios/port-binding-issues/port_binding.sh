#!/bin/bash
# Simulate port binding issue by binding the same port twice
echo "Starting two processes binding the same port"
nc -l 8080 &
nc -l 8080
