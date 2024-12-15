## OOM Killed

### Description:
The pod is terminated due to the Out of Memory (OOM) killer process being invoked, often leading to pod restarts.

### Causes:
- The container exceeds the memory limit.
- Memory leaks in the application or excessive resource usage.

### Fix:
1. Review the memory usage of the application inside the container.
2. Increase the memory resource requests and limits in the pod spec.
3. Monitor the pod’s memory usage to identify spikes or memory leaks.
4. Optimize the application to reduce memory consumption if needed.
