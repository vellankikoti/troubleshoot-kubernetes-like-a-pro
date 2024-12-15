## Crash Due to Insufficient Disk Space

### Description:
A pod crashes due to insufficient disk space, often leading to OOMKilled or file system errors.

### Causes:
- The pod is using more disk space than allocated.
- Logs or temporary files filling up the disk space.

### Fix:
1. Check the available disk space on the node (`df -h`).
2. Review the pod's disk usage (`kubectl exec <pod-name> -- df -h`).
3. If using a persistent volume, ensure it has adequate space and adjust the resource requests accordingly.
4. Configure log rotation and limit disk usage with resource limits.
