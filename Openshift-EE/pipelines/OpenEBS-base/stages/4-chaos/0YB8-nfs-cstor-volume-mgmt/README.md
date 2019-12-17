### 0YB8-Verify applicaton availablity post cstor-pool-mgmt conatiner kill for the NFS Provisioner target.

#### Description

This test induce failure on NFS provisioner target cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- NFS provisioner should be created using cStor storage engine.
- Application (RWX volume) has to be deployed using the NFS (RWO) volume.

#### Procedure

- This job triggers the litmus experiments which induces failure on cstor-pool-mgmt container in cStor pool pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- Then it induces cstor-pool-mgmt container kill chaos and verifies if the application is running successfully.

#### Expected result

- NFS provisioner pod Should be accessible.
- Application that using NFS rwo volume should be running successfully.

#### Test Result

