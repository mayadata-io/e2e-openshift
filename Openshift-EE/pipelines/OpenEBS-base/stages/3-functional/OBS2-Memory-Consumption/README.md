### Checking memory consumption

#### Description
Ensure that the memory consumption doesn't cross the threshold value for a known workload.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy an application using openebs cstor based storage class.
- Ensure that the application and storage components are running successfully.
- Dump data using the dd-client image.
- Make sure that the consumption doesn't cross the threshold value set.

#### Test result
