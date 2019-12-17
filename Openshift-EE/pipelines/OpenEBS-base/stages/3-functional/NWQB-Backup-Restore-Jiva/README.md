### NWQB - Checking velero Backup and Restore using OpenEBS JIVA storage Engine.

#### Description

The goal of this test is to Verify the Backup of JIVA volume and Restore it successfully using velero plugin.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- An application should be deployed using jiva based on storage class with desired replica count.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- Backup of jiva volume can be taken and it has been restored successfully.

#### Expected result

- Jiva volume Backup and Restore should be successfull.
- Application writes should be happen successyfully.
- Data Writes before taking Backup should be retrived successfully after Restore the volume happens.

#### Test result
