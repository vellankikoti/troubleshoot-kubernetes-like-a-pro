# Kubernetes Troubleshooting Scenarios

Welcome to the **Kubernetes Troubleshooting Scenarios Simulator**! This repository contains **35 real-world Kubernetes issues** that you can simulate, analyze, and resolve. Whether you're a beginner or an experienced Kubernetes professional, this project will help you gain hands-on troubleshooting experience in Kubernetes environments.

## Why This Repository?

- **35 real-world scenarios**: Each scenario is designed to reflect actual Kubernetes issues you may encounter in production environments.
- **Step-by-step troubleshooting**: Follow clear instructions for simulating issues, investigating problems, and applying solutions.
- **Hands-on practice**: Learn by doing! Build your troubleshooting skills in a real Kubernetes environment.
- **Docker integration**: Learn how to build and run Docker containers for each scenario as needed.

---

## Features

- **35 Kubernetes troubleshooting scenarios** covering networking, storage, security, performance, and more.
- **Dockerfiles** are provided for building containerized environments to simulate each scenario (only when needed).
- **Automation script** to build and push Docker images for all scenarios to DockerHub.
- **Practical solutions** and explanations to help you understand the root causes of issues.
- **Comprehensive troubleshooting tips**: Includes best practices and additional troubleshooting strategies for real-world Kubernetes environments.

---

## Getting Started

### Prerequisites

1. **Kubernetes Cluster**:
   - Ensure you have access to a Kubernetes cluster. You can use Minikube, Docker Desktop, or a cloud-managed service like AWS EKS, GKE, or AKS.

2. **Install kubectl**:
   - `kubectl` is the Kubernetes command-line tool that you'll use to interact with your cluster.
   - Download and install it from the [official Kubernetes site](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
   - To verify installation:
     ```bash
     kubectl version --client
     ```

3. **Install Docker**:
   - Install Docker to build images locally or on your preferred CI/CD pipeline.
   - Download Docker from the [official Docker site](https://www.docker.com/products/docker-desktop).

4. **Clone the Repository**:
   - Clone the repository to your local machine:
     ```bash
     git clone https://github.com/vellankikoti/troubleshoot-kubernetes-like-a-pro.git
     cd troubleshoot-kubernetes-like-a-pro
     ```

---

## Building Docker Images

### How Docker Images Are Built

Docker images are used to simulate the scenarios, and the Dockerfiles are located in the `dockerfiles/` folder, separate from the scenario folders. **You don’t need to manually create an image for every scenario**. Instead, you can use the provided automation script to build and push all images at once.

### Step 1: Configure Your DockerHub Username

Before building and pushing images, make sure to configure your DockerHub username in the automation script. The default username is set to **`vellankikoti`**, but you can easily replace it with your own DockerHub username.

1. Open the automation script file: `scripts/build_and_push.sh`
2. Replace the username in the script:
   ```bash
   DOCKER_USERNAME="vellankikoti"  # Change this to your DockerHub username
   ```

### Step 2: Build and Push Docker Images

Once the username is configured, you can run the automation script to build all Docker images and push them to DockerHub:

1. **Run the script**:
   ```bash
   ./scripts/build_and_push.sh
   ```

2. The script will automatically:
   - Build the Docker images for the scenarios that require them (based on the Dockerfiles in `dockerfiles/`).
   - Tag the images with your DockerHub username.
   - Push the images to your DockerHub account.

### Step 3: Running the Docker Containers Locally

Once the images are pushed to DockerHub, you can run the containers to simulate the troubleshooting scenarios locally. To do this:

1. Pull the image from DockerHub:
   ```bash
   docker pull <your-dockerhub-username>/<scenario-name>:latest
   ```

2. Run the container:
   ```bash
   docker run -it --rm <your-dockerhub-username>/<scenario-name>:latest
   ```

For example, to run the "Affinity Rules Violation" scenario:
```bash
docker run -it --rm vellankikoti/affinity-rules-violation:latest
```

### Step 4: Clean Up

After running the container, you can remove the image (optional) to free up space:
```bash
docker rmi <your-dockerhub-username>/<scenario-name>:latest
```

---

## Running the Scenarios in Kubernetes

If you have access to a Kubernetes cluster, you can run these scenarios directly within your cluster.

### Step 1: Make the Script Executable

In the root directory of the repository, you will find a script to help manage the scenarios:
```bash
chmod +x manage-scenarios.sh
```

### Step 2: Run the Script

Start the scenario management script:
```bash
./manage-scenarios.sh
```

### Step 3: Choose a Scenario

The script will display a list of 35 scenarios. Each scenario corresponds to a real-world issue in Kubernetes. Enter the scenario number to simulate and resolve the issue.

For example, enter `1` to simulate the "Affinity Rules Violation."

### Step 4: Simulate the Issue

The script will apply the `issue.yaml` file to simulate the problem in your Kubernetes cluster. You can inspect the issue with:
```bash
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

### Step 5: Apply the Fix

After analyzing the issue, the script will guide you to apply the corresponding `fix.yaml` file to resolve the issue:
```bash
kubectl apply -f fix.yaml
```

Verify that the issue is resolved by checking the pod's status:
```bash
kubectl get pods
```

---

## Folder Structure

The repository is organized as follows:

```
troubleshoot-kubernetes-like-a-pro/
├── dockerfiles/
│   ├── affinity-rules-violation/
│   ├── dns-resolution-failure/
│   ├── resource-issues/
│   └── ...
├── scenarios/
│   ├── affinity-rules-violation/
│   ├── dns-resolution-failure/
│   ├── resource-issues/
│   └── ...
├── scripts/
│   └── build_and_push.sh  # Automation script to build and push Docker images
├── manage-scenarios.sh    # Script to simulate and manage scenarios in Kubernetes
└── README.md
```

- **dockerfiles/**: Contains Dockerfiles to build images for scenarios.
- **scenarios/**: Contains individual scenario folders, each with YAML files (`issue.yaml`, `fix.yaml`) and a `description.md`.
- **scripts/**: Contains the automation script for building and pushing Docker images (`build_and_push.sh`).

---

## Available Scenarios

The repository includes the following 35 Kubernetes troubleshooting scenarios:

1. **Affinity Rules Violation**
2. **DNS Resolution Failure**
3. **Insufficient Resources**
4. **Outdated Kubernetes Version**
5. **Security Context Issues**
6. **CGroup Issues**
7. **Failed Resource Limits**
8. **Liveness Probe Failure**
9. **Persistent Volume Claim Issues**
10. **SELinux/AppArmor Policy Violation**
11. **Cluster Autoscaler Issues**
12. **File Permissions on Mounted Volumes**
13. **Liveness & Readiness Failure**
14. **PID Namespace Collision**
15. **Service Account Permissions Issue**
16. **Container Runtime (CRI) Errors**
17. **Firewall Restriction**
18. **LoadBalancer Service Misconfiguration**
19. **Pod Disruption Budget Violations**
20. **Service Port Mismatch**
21. **Crash Due to Insufficient Disk Space**
22. **Image Pull Backoff**
23. **Network Connectivity Issues**
24. **Port Binding Issues**
25. **Taints and Tolerations Mismatch**
26. **CrashLoopBackOff**
27. **Image Pull Error**
28. **Node Affinity Issue**
29. **Readiness Probe Failure**
30. **Volume Mount Issue**
31. **Disk IO Errors**
32. **Ingress Configuration Issue**
33. **OOM Killed**
34. **Resource Requests & Limits Mismatch**
35. **Wrong Container Command**

---

## Troubleshooting Tips

- Always check the logs and describe the pod to identify the issue:
  ```bash
  kubectl logs <pod-name>
  kubectl describe pod <pod-name>
  ```

- If a fix doesn’t resolve the issue, verify cluster configurations and try reapplying the scenario.

- In case the Docker container is not sufficient for troubleshooting, switch to Kubernetes to inspect and apply fixes directly.

---

## Contributing

Contributions are welcome! Feel free to:
- **Add new scenarios**: If you have an interesting or challenging Kubernetes issue, contribute by adding it to this repo.
- **Improve existing scenarios**: Fix bugs, improve documentation, or suggest enhancements.

To contribute, please submit a pull request with your changes.

---

## License

This project is licensed under the MIT License.

---

## Special Thanks

This project is maintained by [Koti](https://www.linkedin.com/in/vellankikoti/). Thank you for exploring the Kubernetes Troubleshooting Scenarios Simulator!

---

### 🚀 Enjoy learning Kubernetes troubleshooting!
