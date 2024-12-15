#!/bin/bash
# Simulates a LoadBalancer misconfiguration with missing port definitions

echo "Simulating LoadBalancer misconfiguration with missing ports"
kubectl apply -f - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: missing-ports-lb
spec:
  type: LoadBalancer
  selector:
    app: test
EOF
