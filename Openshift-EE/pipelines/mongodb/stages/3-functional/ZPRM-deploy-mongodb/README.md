### Deploy MongoDB.

#### Description

This job will deploy Mongodb application which uses OpenEBS cStor based persistent volumes.

#### Prerequisites

- The OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.

#### Procedure

- The job triggers litmusbook which is capable of installing MongoDB statefulset application in its isolated namespace.
- The necessary inputs such as application label, namespace, size of PV can be passed as environmental variables to ansible-runner pod.
- Check if the MongoDB pods are  created and all replicas are running using the kubectl command `kubectl get pods -n <namespace>`

#### Test Result

