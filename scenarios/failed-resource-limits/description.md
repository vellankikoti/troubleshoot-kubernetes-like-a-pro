## Failed Resource Limits

### Description:
A pod is unable to start due to misconfigured resource limits or requests, resulting in failed resource allocation.

### Causes:
- Over-estimated resource requests.
- Resource limits exceeding available cluster resources.

### Fix:
1. Verify the available resources on the nodes (`kubectl describe node <node-name>`).
2. Adjust the pod’s resource requests and limits to match the available resources.
3. Use resource quotas to ensure fair distribution of resources among pods.
