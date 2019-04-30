### CL2N-Creating snapshot for Jiva Volume

#### Description

The goal of this test is to ensure that the snapshot can be created for Jiva Volume successfully.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva storage pool and storage class should be created. 

#### Procedure

- This job triggers the litmus experiments which checks if the Jiva volume snapshot can be created successfully.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The first litmus experiment deploys busybox application with single Jiva volume replica.
- The next litmus experiment updates the snapshot template with the pvc and namespace values.
- It uses create-snapshot utility to create volume snapshot.
- Finally, the job checks if the snapshot is created successfully in all the associated storage pool pods.

#### Expected result

- The volume snapshot should be created successfully.

#### Test Result