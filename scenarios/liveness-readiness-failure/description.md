## Liveness/Readiness Probe Failure

### Description:
Both the liveness and readiness probes fail, causing Kubernetes to repeatedly restart the pod or not route traffic to it.

### Causes:
- Misconfigured probe settings or incorrect paths.
- The application inside the container is not ready or healthy.

### Fix:
1. Review the liveness and readiness probe configurations and verify if the endpoints and initial delays are correct.
2. Ensure that the application is responding to the probes and is running as expected.
3. If necessary, adjust the probe configurations to allow for enough time for the application to start.
4. Use `kubectl logs` to troubleshoot application-level issues.
