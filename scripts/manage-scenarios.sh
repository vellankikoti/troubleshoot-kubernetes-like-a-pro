#!/bin/bash

# This script helps to simulate and resolve Kubernetes troubleshooting scenarios
# It will guide the user to choose a scenario, apply the issue and fix YAMLs, and manage resources accordingly.

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

  # Display the issue YAML content
  echo -e "\n** Issue for Scenario: $scenario **"
  cat issue.yaml

  # Apply the issue YAML
  echo -e "\nSimulating the issue..."
  kubectl apply -f issue.yaml

  echo -e "\nYou can check the status of the issue using kubectl commands such as:"
  echo "  kubectl get pods"
  echo "  kubectl describe pod <pod_name>"
  echo "  kubectl logs <pod_name>"
  read -p "Press Enter to continue and apply the fix..."

  # Display the fix YAML content
  echo -e "\n** Fix for Scenario: $scenario **"
  cat fix.yaml

  # Apply the fix YAML
  echo -e "\nApplying the fix..."
  kubectl apply -f fix.yaml

  echo -e "\nThe fix has been applied."
  echo "Check the status again using kubectl commands to ensure the issue is resolved."

  # Prompt user to clean up resources or retain them
  while true; do
    echo -e "\nDo you want to clean up resources related to this scenario?"
    read -p "(y/yes to delete, n/no to keep): " cleanup_choice

    case $cleanup_choice in
      [Yy]|[Yy][Ee][Ss])
        echo "Cleaning up resources for scenario: $scenario"
        kubectl delete -f issue.yaml
        kubectl delete -f fix.yaml
        echo "Resources have been cleaned up."
        break
        ;;
      [Nn]|[Nn][Oo])
        echo "Retaining resources for scenario: $scenario."
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
echo "Choose a scenario to simulate and resolve."

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
