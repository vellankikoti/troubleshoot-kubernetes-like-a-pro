#!/bin/bash
# Simulates misconfigured paths in an Ingress resource

echo "Simulating an Ingress resource with misconfigured paths"
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: misconfigured-ingress
spec:
  rules:
    - host: "example.com"
      http:
        paths:
          - path: /api
            pathType: Prefix
            backend:
              service:
                name: non-existing-service # Points to a non-existing service
                port:
                  number: 80
EOF
