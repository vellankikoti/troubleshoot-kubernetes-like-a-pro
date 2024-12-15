# Kubernetes Troubleshooting Scenarios

Welcome to the **Kubernetes Troubleshooting Scenarios Simulator**! This repository contains 35 real-world Kubernetes issues that you can simulate, analyze, and resolve. Each scenario is designed to help you gain hands-on experience with troubleshooting in Kubernetes environments.

## How to Use This Repository

### Prerequisites
1. **Kubernetes Cluster**:
   - Ensure you have access to a Kubernetes cluster. You can use a local setup like Minikube, Docker Desktop, or a managed service like AWS EKS, GKE, or AKS.

2. **`kubectl` Installed**:
   - Install and configure `kubectl` to manage your Kubernetes cluster.
   - Verify your cluster connection:
     ```bash
     kubectl config use-context <your-cluster-context>
     kubectl get nodes
     ```

3. **Clone the Repository**:
   - Clone this repository to your local machine:
     ```bash
     git clone https://github.com/vellankikoti/troubleshoot-kubernetes-like-a-pro.git
     cd troubleshoot-kubernetes-like-a-pro
     ```

### Running the Scenarios

1. **Make the Script Executable**:
   - Ensure the script is executable:
     ```bash
     chmod +x manage-scenarios.sh
     ```

2. **Run the Script**:
   - Start the simulation by running:
     ```bash
     ./manage-scenarios.sh
     ```

3. **Choose a Scenario**:
   - The script will display a list of 35 scenarios. Each scenario represents a real-world Kubernetes issue.
   - Enter the scenario number to simulate and fix. For example, enter `1` for "Affinity Rules Violation."

4. **Simulate the Issue**:
   - The script will apply the `issue.yaml` file for the selected scenario, simulating the problem in your Kubernetes cluster.
   - You can inspect the issue using commands like:
     ```bash
     kubectl describe pod <pod-name>
     kubectl logs <pod-name>
     ```

5. **Apply the Fix**:
   - After reviewing the issue, the script will guide you to apply the `fix.yaml` file to resolve it.
   - Verify that the issue is resolved by checking the pod's status or logs.

### Example Workflow
1. Run the script:
   ```bash
   ./manage-scenarios.sh
   ```
2. Choose a scenario, e.g., "Affinity Rules Violation" (Scenario 1).
3. The script will:
   - Apply the issue YAML (`issue.yaml`).
   - Guide you to check the issue using `kubectl`.
4. Apply the fix YAML (`fix.yaml`) to resolve the issue.
5. Verify the resolution.

### Folder Structure
Each scenario is organized in its own folder under the `scenarios/` directory. For example:
```
scenarios/
  affinity-rules-violation/
    issue.yaml       # Simulates the problem
    fix.yaml         # Contains the solution
    description.md   # Explains the root cause and resolution
```

### Available Scenarios
The repository includes the following scenarios:
1. Affinity Rules Violation
2. DNS Resolution Failure
3. Insufficient Resources
4. Outdated Kubernetes Version
5. Security Context Issues
6. CGroup Issues
7. Failed Resource Limits
8. Liveness Probe Failure
9. Persistent Volume Claim Issues
10. SELinux/AppArmor Policy Violation
11. Cluster Autoscaler Issues
12. File Permissions on Mounted Volumes
13. Liveness & Readiness Failure
14. PID Namespace Collision
15. Service Account Permissions Issue
16. Container Runtime (CRI) Errors
17. Firewall Restriction
18. LoadBalancer Service Misconfiguration
19. Pod Disruption Budget Violations
20. Service Port Mismatch
21. Crash Due to Insufficient Disk Space
22. Image Pull Backoff
23. Network Connectivity Issues
24. Port Binding Issues
25. Taints and Tolerations Mismatch
26. CrashLoopBackOff
27. Image Pull Error
28. Node Affinity Issue
29. Readiness Probe Failure
30. Volume Mount Issue
31. Disk IO Errors
32. Ingress Configuration Issue
33. OOM Killed
34. Resource Requests & Limits Mismatch
35. Wrong Container Command

### Troubleshooting Tips
- Always check pod logs and describe the pod to identify issues:
  ```bash
  kubectl logs <pod-name>
  kubectl describe pod <pod-name>
  ```
- If a fix does not resolve the issue, verify cluster configurations and try reapplying the scenario.

## Contributing
Feel free to contribute new scenarios or improve existing ones by submitting a pull request.

## License
This project is licensed under the MIT License.

---
Enjoy learning Kubernetes troubleshooting! 🚀

This is [Koti](https://www.linkedin.com/in/vellankikoti/)

