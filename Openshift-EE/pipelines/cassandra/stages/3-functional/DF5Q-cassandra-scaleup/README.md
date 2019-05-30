### Cassandra Scaleup.

#### Description

This job will scale up the applications replicas in cassandra statefulset .

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.
- Cassandra should be deployed in cluster.

#### Procedure

- The job triggers litmusbook which is capable of scaling up the replicas in Cassandra statefulset application. The desired number of application replicas should be passed as env in the litmus pod.
- Check if statefulset is scaled up and all replicas are running using the kubectl command `kubectl get sts -n <namespace>`

#### Test Result

