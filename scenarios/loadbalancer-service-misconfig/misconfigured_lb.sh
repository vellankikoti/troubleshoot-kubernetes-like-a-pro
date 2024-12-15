#!/bin/bash
# Simulates incorrect annotations for a LoadBalancer service

echo "Simulating LoadBalancer misconfiguration with incorrect annotations"
kubectl apply -f - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: misconfigured-lb
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-internal: "true" # This might not work with the cluster setup
spec:
  type: LoadBalancer
  selector:
    app: test
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
EOF
