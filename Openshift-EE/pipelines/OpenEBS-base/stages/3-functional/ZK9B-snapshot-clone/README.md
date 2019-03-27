### ZK9B-Creating Clone volume

#### Description

This test ensures that the clone volume can be created successfully using volume snapshot.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which creates clone volume using volume snapshot.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job checks if the provided snapshot is created in the cluster and snapshot-promoter storageclass is created.
- It Updates the clone template with the input parameters such as snapshot name, storage class and the application namespace.
- Use clone creation utility to create clone.
- Finally, it checks if the cloned volume is bound and can be usable.

#### Expected result

- The clone volume should be created successfully and should possess the data.

#### Test Result

