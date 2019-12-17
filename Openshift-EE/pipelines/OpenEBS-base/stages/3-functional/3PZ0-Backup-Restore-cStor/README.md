### 3PZ0 - Checking velero Backup and Restore using OpenEBS cStor storage Engine.

#### Description

The goal of this test is to Verify the Backup of cStor volume and Restore it successfully using velero plugin.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- An application should be deployed using cstor based on storage class with desired replica count.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- Backup of cStor volume can be taken and it has been restored successfully.

#### Expected result

- cStor volume Backup and Restore should be successfull.
- Application writes should be happen successyfully.
- Data Writes before taking Backup should be retrived successfully after Restore the volume happens.

#### Test result
