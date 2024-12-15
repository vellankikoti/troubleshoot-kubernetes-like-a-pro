# Troubleshoot Kubernetes Like a Pro: Real-World Scenarios

## Purpose of the Project

This repository aims to provide a **comprehensive Kubernetes troubleshooting guide** to help you diagnose and resolve common issues you may encounter in production environments. Kubernetes can be complex to manage, especially when dealing with distributed systems, scaling, and resource management. Through this collection of **35 production-grade scenarios**, we aim to simulate real-world problems and provide practical solutions to them.

Whether you’re a **Kubernetes beginner** or an **experienced DevOps engineer**, this guide will help you gain a deeper understanding of Kubernetes operations by walking through each scenario step-by-step. By simulating these issues and troubleshooting them, you'll be able to learn and apply essential Kubernetes concepts while becoming proficient in handling production-grade issues.

---

## Troubleshooting Scenarios

### **Before Pod Gets Scheduled**

1. **insufficient-resource-pod**
   - **Description**: The pod is in a pending state due to insufficient CPU or memory resources on the node.
   - **Fix**: Adjust the pod's resource requests or scale your cluster.

2. **node-affinity-failure**
   - **Description**: Pods fail to be scheduled because they do not meet the node affinity rules.
   - **Fix**: Update node affinity rules to match available nodes.

3. **taint-toleration-mismatch**
   - **Description**: Pods do not tolerate node taints, causing them to remain unscheduled.
   - **Fix**: Add proper tolerations to the pod or remove taints from nodes.

4. **pending-pod**
   - **Description**: A pod is stuck in a `Pending` state with no apparent reason.
   - **Fix**: Check for resource availability, pod configuration, and scheduling issues.

5. **image-pull-failure**
   - **Description**: The pod cannot pull its container image from the registry.
   - **Fix**: Ensure the image exists, and authentication credentials (if necessary) are correct.

### **Pod Scheduled, But Container Errors**

6. **container-crashloopbackoff**
   - **Description**: The container in the pod is continuously crashing.
   - **Fix**: Investigate logs to identify the cause and resolve the issue (e.g., missing dependencies, incorrect commands).

7. **container-oom-killed**
   - **Description**: The container gets killed due to exceeding memory limits.
   - **Fix**: Increase the memory limits or optimize the container's memory usage.

8. **container-terminated-error**
   - **Description**: The container terminates unexpectedly with no clear reason.
   - **Fix**: Check container logs and configuration.

9. **image-pull-errors**
   - **Description**: The container cannot pull the required image.
   - **Fix**: Verify the image repository credentials and network access.

10. **liveness-probe-failure**
    - **Description**: The pod fails the liveness probe check.
    - **Fix**: Ensure the application inside the container is responding to the probe correctly.

### **Pod Scheduled, But Container Runtime Errors**

11. **pod-network-not-available**
    - **Description**: Network connectivity between pods is unavailable.
    - **Fix**: Check the network plugin and configuration.

12. **pod-initialization-failure**
    - **Description**: The pod is unable to initialize or start properly.
    - **Fix**: Check for issues in the pod spec, volume mounts, or container images.

13. **pod-storage-error**
    - **Description**: The pod cannot mount its storage volume.
    - **Fix**: Verify storage class, PVC, and node access to volumes.

14. **pod-internal-dependency-error**
    - **Description**: The pod fails to start due to missing dependencies within the cluster.
    - **Fix**: Ensure required services, secrets, or configs are accessible.

15. **pod-not-accessible-via-internal-service**
    - **Description**: The pod is running but is not accessible from within the cluster.
    - **Fix**: Ensure the internal service is correctly defined and routing traffic properly.

### **Pod Scheduled, Container and Runtime Are Fine, But Application is Not Accessible**

16. **loadbalancer-service-misconfig**
    - **Description**: Misconfigured LoadBalancer service, failing to route traffic to the pods.
    - **Fix**: Ensure proper configuration for LoadBalancer services.

17. **firewall-restriction**
    - **Description**: Firewall or security group settings block external access to the LoadBalancer.
    - **Fix**: Adjust firewall rules to allow inbound traffic.

18. **ingress-configuration-issue**
    - **Description**: Incorrect ingress configuration, causing failure to route external traffic to the correct service.
    - **Fix**: Review and correct ingress rules.

19. **service-port-mismatch**
    - **Description**: Mismatch between the external port exposed and the internal service port.
    - **Fix**: Ensure that service ports match between internal and external configurations.

20. **dns-resolution-failure**
    - **Description**: DNS names are not resolving correctly, though services work internally with `curl`.
    - **Fix**: Verify DNS configurations in the cluster and external DNS resolution settings.

---

### **Additional Scenarios**

21. **pod-readiness-failure**
    - **Description**: Pod readiness probe fails, causing the pod to be considered unavailable.
    - **Fix**: Review the readiness probe configuration and application health.

22. **volume-attachment-failure**
    - **Description**: Failure in attaching volumes to the pod.
    - **Fix**: Ensure the correct volume is specified and check cloud provider restrictions.

23. **pod-over-scaling**
    - **Description**: Pods are over-scaling, exhausting node resources.
    - **Fix**: Configure Horizontal Pod Autoscaler (HPA) with proper limits.

24. **metrics-server-failure**
    - **Description**: Metrics server fails, preventing autoscaling.
    - **Fix**: Install or configure the metrics server correctly.

25. **namespace-lifecycle-issue**
    - **Description**: Pod fails to be created or terminated due to namespace issues.
    - **Fix**: Check the namespace existence and permissions.

26. **resource-quota-exceeded**
    - **Description**: Resource quota exceeded in the namespace.
    - **Fix**: Adjust resource quotas or free up resources.

27. **kube-apiserver-unreachable**
    - **Description**: Unable to reach the kube-apiserver, causing control-plane issues.
    - **Fix**: Check kube-apiserver health and network connectivity.

28. **etcd-consistency-issue**
    - **Description**: The etcd cluster becomes inconsistent, causing various issues.
    - **Fix**: Perform etcd recovery or check for disk space/consistency issues.

29. **kubelet-timeout**
    - **Description**: Kubelet times out while starting or terminating pods.
    - **Fix**: Review kubelet logs and network settings.

30. **node-eviction**
    - **Description**: Pods are evicted due to node resource pressure.
    - **Fix**: Investigate resource usage and optimize pod placement.

31. **scheduler-bug**
    - **Description**: Scheduler fails to properly schedule pods on available nodes.
    - **Fix**: Investigate scheduler logs for bugs or misconfigurations.

32. **crashloopbackoff-due-to-configmap**
    - **Description**: A pod goes into `CrashLoopBackOff` due to a missing or incorrect `ConfigMap`.
    - **Fix**: Ensure the correct `ConfigMap` is present and properly referenced.

33. **pod-mount-failure**
    - **Description**: The pod fails to mount required files or secrets.
    - **Fix**: Verify volume and secret references in the pod configuration.

34. **storage-class-issue**
    - **Description**: Incorrect storage class prevents pod from accessing persistent storage.
    - **Fix**: Review storage class and PVC configuration for correctness.

35. **pod-memory-leak**
    - **Description**: The pod suffers from memory leaks, causing the container to consume excessive memory over time.
    - **Fix**: Investigate application logs and optimize memory usage in the pod.

---

## How to Simulate and Fix These Issues

Each folder in this repository contains:
- **`issue.yaml`** files to simulate the errors.
- **`fix.yaml`** files to resolve the issues.
- **`description.md`** providing an in-depth explanation of the issue and its resolution.

You can simulate a scenario by applying the respective `issue.yaml` file, diagnose the issue, and then apply the `fix.yaml` file to resolve it. 

### How to Use the Shell Script:
1. Clone the repository.
2. Navigate to the `scripts/` directory.
3. Run the `manage-scenarios.sh` script.
4. Enter the scenario number when prompted, and the script will guide you through the issue and fix process.
```
