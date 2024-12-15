# Scenario 1: Insufficient Resource Pod

## Problem:
You may encounter a situation where a pod is stuck in the `Pending` state due to insufficient resources (memory or CPU) available on the node to satisfy the pod's resource request and limits.

### Steps to Reproduce:
1. Create a pod with a high resource request and limit, which exceeds the available resources on the node.
2. The pod will be scheduled in the `Pending` state, and if you describe the pod (`kubectl describe pod insufficient-resource-pod`), you’ll see messages about insufficient resources.

## Solution:
In such cases, you need to either:
1. Adjust the pod's resource requests and limits to match available resources.
2. Add more resources to the node, or scale the cluster to provide more resources.

### Example Fix:
In the provided `fix.yaml` file, we reduced the pod's memory and CPU requests to values that are more likely to fit within the available node resources.

Run the following command to apply the fixed configuration:

```bash
kubectl apply -f fix.yaml
