### SN3A-Checking memory consumption in jiva controller.

#### Description

This test ensures that the memory consumption in a jiva target doesn't exceed the threshold value for a known workload.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.
- OpenEBS storage class usin jiva cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the memory consumption in jiva controller exceeds the set threshold value upon pumping trafic.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using openebs jiva based storage class.
- It pumps data into the volume using dd-client image which performs the known workload.
- It ensures that the memory consumption in the storage controller doesn't cross the threshold value set.

#### Expected result

- The memory consumption should not exceed the threshold value.

#### Test result