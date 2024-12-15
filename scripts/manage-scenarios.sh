#!/bin/bash

# This script helps to simulate and resolve Kubernetes troubleshooting scenarios

# Define function to display usage
usage() {
  echo "Usage: ./manage-scenarios.sh"
  echo "Follow the prompts to simulate and resolve Kubernetes troubleshooting scenarios."
}

# Function to simulate and fix scenarios
simulate_and_fix() {
  scenario=$1
  echo "Simulating Scenario: $scenario"

  # Navigate to the corresponding scenario folder
  cd "scenarios/$scenario" || { echo "Scenario folder not found!"; exit 1; }

  # First, clean up any existing resources from previous runs
  kubectl delete -f issue.yaml >/dev/null 2>&1
  kubectl delete -f fix.yaml >/dev/null 2>&1

  # Display the issue YAML content
  echo -e "\n** Issue YAML that will be applied: **"
  cat issue.yaml

  # Apply the issue YAML to create the problem
  echo -e "\nCreating the issue scenario..."
  kubectl apply -f issue.yaml || { echo "Failed to apply issue.yaml"; exit 1; }

  # Wait for a few seconds to let the issue manifest
  echo -e "\nWaiting for the issue to manifest..."
  sleep 5

  echo -e "\nCurrent status of pods:"
  kubectl get pods || { echo "Failed to get pods status"; exit 1; }

  echo -e "\nYou can use the following commands to investigate:"
  echo "  kubectl get pods"
  echo "  kubectl describe pod <pod_name>"
  echo "  kubectl logs <pod_name>"
  
  read -p "Press Enter when you're ready to see and apply the fix..."

  # Display the fix YAML content
  echo -e "\n** Fix YAML that will be applied: **"
  cat fix.yaml

  # Delete the issue resources before applying the fix
  echo -e "\nRemoving the issue configuration..."
  kubectl delete -f issue.yaml --grace-period=0 --force || { echo "Failed to delete issue.yaml"; exit 1; }

  # Wait for resources to be cleaned up
  echo -e "\nWaiting for cleanup..."
  sleep 3

  # Apply the fix YAML
  echo -e "\nApplying the fix..."
  kubectl apply -f fix.yaml || { echo "Failed to apply fix.yaml"; exit 1; }

  # Wait for a few seconds to let the fix take effect
  sleep 5

  echo -e "\nCurrent status after applying fix:"
  kubectl get pods || { echo "Failed to get pods status after applying fix"; exit 1; }

  # Prompt user to clean up resources or retain them
  while true; do
    echo -e "\nDo you want to clean up all resources related to this scenario?"
    read -p "(y/yes to delete, n/no to keep): " cleanup_choice

    case $cleanup_choice in
      [Yy]|[Yy][Ee][Ss])
        echo "Cleaning up resources for scenario: $scenario"
        kubectl delete -f fix.yaml --grace-period=0 --force || { echo "Failed to delete fix.yaml"; exit 1; }
        echo "Resources have been cleaned up."
        break
        ;;

      [Nn]|[Nn][Oo])
        echo "Retaining resources for scenario: $scenario"
        break
        ;;

      *)
        echo "Invalid input. Please enter y/yes or n/no."
        ;;
    esac
  done

  # Return to the main script directory
  cd - > /dev/null
}

# Scenario list
scenarios=(
  "affinity-rules-violation"
  "dns-resolution-failure"
  "insufficient-resources"
  "outdated-kubernetes-version"
  "security-context-issues"
  "cgroup-issues"
  "failed-resource-limits"
  "liveness-probe-failure"
  "persistent-volume-claim-issues"
  "selinux-apparmor-policy-violation"
  "cluster-autoscaler-issues"
  "file-permissions-on-mounted-volumes"
  "liveness-readiness-failure"
  "pid-namespace-collision"
  "service-account-permissions-issue"
  "container-runtime-cri-errors"
  "firewall-restriction"
  "loadbalancer-service-misconfig"
  "pod-disruption-budget-violations"
  "service-port-mismatch"
  "crash-due-to-insufficient-disk-space"
  "image-pull-backoff"
  "network-connectivity-issues"
  "port-binding-issues"
  "taints-and-tolerations-mismatch"
  "crashloopbackoff"
  "image-pull-error"
  "node-affinity-issue"
  "readiness-probe-failure"
  "volume-mount-issue"
  "disk-io-errors"
  "ingress-configuration-issue"
  "oom-killed"
  "resource-requests-limits-mismatch"
  "wrong-container-command"
)

# Start of script execution
echo "Welcome to the Kubernetes Troubleshooting Scenarios Simulator!"
echo "This script will help you practice troubleshooting various Kubernetes issues."
echo "For each scenario, we will:"
echo "1. Create an issue"
echo "2. Let you examine it"
echo "3. Apply a fix"
echo "4. Verify the resolution"

# Display available scenarios
echo -e "\nAvailable scenarios:"
for i in "${!scenarios[@]}"; do
  echo "$((i + 1)). ${scenarios[$i]}"
done

# Prompt user to choose a scenario
read -p "Enter the scenario number (1-35): " scenario_number

# Check if the entered number is valid
if [[ $scenario_number -ge 1 && $scenario_number -le 35 ]]; then
  scenario="${scenarios[$((scenario_number - 1))]}"
  simulate_and_fix "$scenario"
else
  echo "Invalid input. Please enter a valid scenario number (1-35)."
  usage
fi
