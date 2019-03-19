### Deploy Cassandra.

#### Description

This job will deploy Cassandra statefulset using OpenEBS cStor persistent volumes.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.

#### Procedure

- The job should trigger the litmusbook which is capable of deploying cassandra statefulset using the manifest.
- The inputs such as application label, storage class , PV capacity as environmental variable to the ansible-runner pod which executes the test.
- Check if the cassandra statefulset is created successfully using kubectl command `kubectl get sts -n <application namespace>`

#### Test Result

