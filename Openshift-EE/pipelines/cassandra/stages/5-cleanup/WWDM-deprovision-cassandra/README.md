#### Deprovision Cassandra

This job will delete the cassandra statefulset installed in OpenShift cluster.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed.
- Cassandra should be deployed

#### Procedure

- The job should trigger the litmusbook which is capable of deleting Cassandra specific components in the cluster.

- This should delete all the components in the respective namespace.

- This can be verified using kubectl command `kubectl get ns`


#### Test Result

