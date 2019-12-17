### 8ZWN - Verify application availablity post jiva controller failure of NFS provisioner

#### Description

This test kills the NFS jiva controller pod and check if it doesn't affect the applications that using NFS JIVA volumes.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- jiva based storage class should have been created.
- NFS provisioner has to be deployed using JIVA storage Engine.
- Storage Class should be created using NFS Provisioner.
- Application should be deployed that using NFS volume.

#### Procedure

- This job triggers the litmus experiments which kills the jiva controller pod and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- Then, it kills the NFS Provisioner jiva controller pod and verify if the application that using NFS provisioner volume is running successfull.

#### Expected result

- JIVA NFS provisioner Pod has to be Successfully running.
- Application writes should be running successfully.

#### Test Result

