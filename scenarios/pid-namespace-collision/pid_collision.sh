#!/bin/bash
# Simulate PID namespace collision by sharing process namespace
echo "Simulating PID namespace collision"
sleep infinity &
sleep infinity &
