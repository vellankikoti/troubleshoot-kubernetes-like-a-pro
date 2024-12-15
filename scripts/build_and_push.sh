#!/bin/bash

# Ensure that the script stops on errors
set -e

# DockerHub username (change this to your own DockerHub username)
DOCKER_USERNAME="vellankikoti"  # Replace with your DockerHub username

# Directory where Dockerfiles are located
DOCKERFILES_DIR="./Dockerfiles"

# Log the process
echo "Starting the process of building and pushing Docker images..."

# Function to build and push the Docker image
build_and_push_image() {
  local scenario_name=$1
  local dockerfile_path="$DOCKERFILES_DIR/Dockerfile.$scenario_name"
  
  # Check if Dockerfile exists for the scenario
  if [ -f "$dockerfile_path" ]; then
    echo "Building Docker image for scenario: $scenario_name"
    
    # Build the Docker image
    docker build -t "$DOCKER_USERNAME/$scenario_name:latest" -f "$dockerfile_path" .

    # Push the Docker image to DockerHub
    echo "Pushing Docker image for scenario: $scenario_name"
    docker push "$DOCKER_USERNAME/$scenario_name:latest"
  else
    echo "Dockerfile not found for scenario: $scenario_name, skipping..."
  fi
}

# Build and push Docker images for each scenario (only for Dockerfile.*)
for dockerfile in $(find $DOCKERFILES_DIR -name 'Dockerfile.*'); do
  # Extract the scenario name from the Dockerfile name
  scenario_name=$(basename "$dockerfile" | sed 's/Dockerfile\.//')

  # Call the function to build and push the image
  build_and_push_image "$scenario_name"
done

echo "All Docker images have been built and pushed to DockerHub."

# End of script
