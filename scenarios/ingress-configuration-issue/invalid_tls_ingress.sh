#!/bin/bash
# Simulates an Ingress resource with invalid TLS configuration

echo "Simulating an Ingress resource with invalid TLS configuration"
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: invalid-tls-ingress
spec:
  tls:
    - hosts:
        - "example.com"
      secretName: non-existing-secret # References a non-existent TLS secret
  rules:
    - host: "example.com"
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: test-service
                port:
                  number: 80
EOF
