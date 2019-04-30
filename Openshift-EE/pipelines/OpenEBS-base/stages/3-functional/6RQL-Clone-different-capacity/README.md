### 6RQL-Attempting to create clone with different capacity

#### Description

This test ensures that the clone volume can not be created if the capacity is different.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which creates clone volume using volume snapshot.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly. Update the clone capacity with value other than capacity of actual PV.
- This job checks if the provided snapshot is created in the cluster and snapshot-promoter storageclass is created.
- It updates the clone template with the input parameters such as snapshot name, storage class and the application namespace.
- Use clone creation utility to create clone.
- Finally, it checks if the cloned volume is not created . In OpenEBS, admission-controller should block clone creation if the capacity is different.

#### Expected result

- The clone volume should not be created if the capacity is different than the PV capacity.

#### Test Result