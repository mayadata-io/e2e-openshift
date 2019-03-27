
### OBS2-Memory consumption

#### Description

This test ensures that the memory consumption doesn't exceed the threshold value for a known workload.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the memory consumption exceeds rhe set threshold value upon pumping trafic.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using openebs cstor based storage class.
- It pumps data into the volume using dd-client image which performs the known workload.
- It ensures that the memory consumption doesn't cross the threshold value set.

#### Expected result

- The memory consumption should not exceed the threshold value.

#### Test result
