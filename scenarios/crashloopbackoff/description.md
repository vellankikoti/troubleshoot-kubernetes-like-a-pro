## CrashLoopBackOff

### Description:
The pod continuously crashes and restarts due to application or configuration errors, resulting in a `CrashLoopBackOff` status.

### Causes:
- Application-level issues such as missing dependencies or incorrect configurations.
- Insufficient resources or incorrect resource limits.
- Liveness/readiness probe failures.

### Fix:
1. Inspect the pod logs to identify the root cause (`kubectl logs <pod-name>`).
2. Verify that the application configuration and environment variables are correct.
3. Check if resource limits and requests are appropriately set.
4. If probes are failing, adjust the liveness/readiness probe settings.
