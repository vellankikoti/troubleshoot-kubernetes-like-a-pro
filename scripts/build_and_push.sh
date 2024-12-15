#!/bin/bash

# Set your DockerHub username here
DOCKER_USERNAME="vellankikoti"  # Change this to your DockerHub username

# Starting the build and push process
echo "Starting the process of building and pushing Docker images..."

# Loop through each scenario folder
for scenario_dir in ./scenarios/*; do
    if [ -d "$scenario_dir" ]; then
        # Check if a Dockerfile exists in the current scenario folder
        dockerfile="$scenario_dir/Dockerfile"
        if [ -f "$dockerfile" ]; then
            scenario_name=$(basename "$scenario_dir")
            echo "Building Docker image for $scenario_name..."

            # Build the Docker image
            docker build -t "$DOCKER_USERNAME/$scenario_name:latest" -f "$dockerfile" "$scenario_dir"
            
            # Push the image to DockerHub
            echo "Pushing Docker image for $scenario_name to DockerHub..."
            docker push "$DOCKER_USERNAME/$scenario_name:latest"
        else
            echo "No Dockerfile found in $scenario_name, skipping..."
        fi
    fi
done

echo "All Docker images have been built and pushed to DockerHub"
