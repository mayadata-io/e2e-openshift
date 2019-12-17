### I7QP - Verify application availablity post NFS provisioner's cstor target istgt container kill.

#### Description

This test kill the NFS cstor target istgt container and check if it doesn't affect the application using NFS cStor volume.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- NFS Provisioner should be created using cStor storage engine.
- Storage Class should be created using NFS provisoner.
- Application has to be deployed that using NFS Volume.

#### Procedure

- This job triggers the litmus experiments which inducesnetwork loss in cstor-pool container and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- Then, it kills the cstor istgt container and verify if the application is running successfully.

#### Expected result

- Application should be running successfully.

#### Test Result

