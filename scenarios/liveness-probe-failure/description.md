## Liveness Probe Failure

### Description:
The liveness probe fails, leading to the container being restarted because the container is considered unhealthy.

### Causes:
- Incorrect probe configuration (e.g., wrong endpoint or delay).
- Application is not starting properly and is unable to respond to the probe.

### Fix:
1. Check the liveness probe configuration in the pod YAML.
2. Verify if the application inside the container is working properly.
3. Adjust the probe’s initial delay, timeout, and path as needed.
4. Use `kubectl logs <pod-name>` to check application logs for any issues.
