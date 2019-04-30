### Y4ET-Creating Clone for Jiva volume

#### Description

This test ensures that the clone volume can be created on Jiva volume successfully using its snapshot.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva specific storage class and storage pool should be created.

#### Procedure

- This job triggers the litmus experiments which creates clone volume using volume snapshot.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job checks if the provided snapshot is created in the cluster and snapshot-promoter storageclass is created.
- It updates the clone template with the input parameters such as snapshot name, storage class and the application namespace.
- Use clone creation utility to create clone.
- Finally, it checks if the cloned volume is bound and can be usable.

#### Expected result

- The clone volume should be created successfully and should possess the data.

#### 