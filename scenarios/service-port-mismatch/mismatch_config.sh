#!/bin/bash
# Simulate a port mismatch by starting Nginx on a different port than expected
echo "Starting Nginx on port 8080 instead of the expected 80"
sed -i 's/listen 80;/listen 8080;/' /etc/nginx/nginx.conf
nginx -g "daemon off;"
