### Deploy PostgreSQL.

#### Description

This job will deploy postgresql statefulset which uses OpenEBS cStor bases persistent volumes.

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.

#### Procedure

- The job triggers litmusbook which is capable of installing postgresql statefulset application in its isolated namespace.
- Check if statefulset is created and all replicas are running using the kubectl command `kubectl get sts -n <namespace>`

#### Test Result

