#!/bin/bash

# Set your DockerHub username here
DOCKER_USERNAME="vellankikoti"  # Change this to your DockerHub username

# Starting the build and push process
echo "Starting the process of building and pushing Docker images..."

# Check if the 'scenarios' directory exists
if [ ! -d "./scenarios" ]; then
    echo "'scenarios' directory not found. Please make sure your directory structure is correct."
    exit 1
fi

# Loop through each scenario folder in the 'scenarios' directory
for scenario_dir in ./scenarios/*/; do
    # Check if it's a directory
    if [ -d "$scenario_dir" ]; then
        # Print the scenario directory being checked for debugging purposes
        echo "Checking directory: $scenario_dir"
        
        # Determine the scenario name (this will be used for the Docker image tag)
        scenario_name=$(basename "$scenario_dir")

        # Define the path to the Dockerfile (e.g., Dockerfile.image-pull-backoff)
        dockerfile="${scenario_dir}Dockerfile.${scenario_name}"

        # Debugging line: Print the path where the script is looking for the Dockerfile
        echo "Looking for Dockerfile at: $dockerfile"

        # Check if the Dockerfile exists in the expected location
        if [ -f "$dockerfile" ]; then
            # Build the Docker image using the specified Dockerfile
            echo "Building Docker image for $scenario_name..."

            docker build -t "$DOCKER_USERNAME/$scenario_name:latest" -f "$dockerfile" "$scenario_dir"
            
            # Push the image to DockerHub
            echo "Pushing Docker image for $scenario_name to DockerHub..."
            docker push "$DOCKER_USERNAME/$scenario_name:latest"
        else
            echo "No Dockerfile found at $dockerfile for $scenario_name, skipping..."
        fi
    else
        echo "$scenario_dir is not a valid directory. Skipping..."
    fi
done

echo "All Docker images have been built and pushed to DockerHub"
