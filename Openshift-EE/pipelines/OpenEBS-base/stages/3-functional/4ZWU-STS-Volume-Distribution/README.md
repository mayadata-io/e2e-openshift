### 4ZWU-Distributing storage volume replicas across pools.

#### Description

The test goal is to ensure that the storage volume replicas are distributed across cstor storage pools in the case of statefulset application with single storage replica.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which deploy busybox statefulset application using OpenEBS storage class with single storage replica and multiple application replicas. This also triggers litmus experiment which verifies that the cStor volume replicas are distributes across the storage pools created in cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- The preceding litmus experiment verifies if the cstor storage volume replicas are distributed across the pool pods created in multiple nodes.
- Finally, the litmus experiment deletes the application deployed and verifies if the volume is deleted successfully.

#### Test Result
