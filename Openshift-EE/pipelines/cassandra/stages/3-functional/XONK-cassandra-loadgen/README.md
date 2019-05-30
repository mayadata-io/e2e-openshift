### Cassandra Loadgen.

#### Description

This job will deploy cassandra loadgen pod which uses cassandra-stress to pump data into cassandra application.

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.
- Cassandra should be deployed as statefulset

#### Procedure

- The job triggers litmusbook which is capable of installing Cassandra loadgen application in the same namespace where cassandra is deployed.
- Check if job is created using the kubectl command `kubectl get job -n <namespace>`

#### Test Result

