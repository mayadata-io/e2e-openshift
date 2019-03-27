### 9AKX-Creating volume snapshot

#### Description
The goal of this test is to enure that the volume snapshot can be created successfully.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the snapshot can be created successfully.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The first litmus experiment deploys busybox application.
- The next litmus experiment updates the snapshot template with the pvc and namespace values.
- It uses create-snapshot utility to create volume snapshot.
- The job checks if the snapshot is created successfully in all the associated storage pool pods.

#### Expected result

- The volume snapshot should be created successfully in all the pool pods.

#### Test Result

