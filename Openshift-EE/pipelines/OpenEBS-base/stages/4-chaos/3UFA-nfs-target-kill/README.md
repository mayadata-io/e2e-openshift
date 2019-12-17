### 3UFA - Verify application availablity post NFS provisioner cstor target pod kill.

#### Description

This test kills the cstor target pod for NFS Provisioner and check if it doesn't affect the application that using the NFS volumes.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- NFS Provisioner should be created using cStor storage engine.

#### Procedure

- This job triggers the litmus experiments which kills the cstor target pod and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- Then, it kills the cstor target pod for NFS provisioner and verify if the application that using NFS volume is running successfully.

#### Expected result

- NFS provisoner Should be running successfully.
- Application that utilizing NFS volume should be running successfully.

#### Test Result

