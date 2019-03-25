### Distributing storage volume replicas across pools.

#### Description
The test goal is to ensure that the storage volume replicas are distributed across cstor storage pools in the case of statefulset application with single storage replica.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy statefulset application using OpenEBS storage class with single storage replica and multiple application replicas.
- Check if the application is deployed successfully.
- Check if the cstor storage volume replicas are distributed across the pool pods created in multiple nodes.
