#!/bin/bash
# Simulate Cluster Autoscaler issue by exceeding node limits
echo "Simulating Cluster Autoscaler node limit breach"
kubectl scale deployment my-app --replicas=1000
