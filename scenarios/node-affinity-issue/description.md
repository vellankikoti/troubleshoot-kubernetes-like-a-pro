## Node Affinity Issue

### Description:
Pods cannot be scheduled on the desired nodes due to a mismatch between the pod’s node affinity rules and the node labels.

### Causes:
- Incorrect node affinity rules in the pod spec.
- Missing or incorrect node labels on the target nodes.

### Fix:
1. Review the node affinity rules in the pod spec and ensure they match the available node labels.
2. Check the node labels using `kubectl describe node <node-name>` and compare them to the affinity rules.
3. Modify the pod's node affinity to match the correct node labels.
