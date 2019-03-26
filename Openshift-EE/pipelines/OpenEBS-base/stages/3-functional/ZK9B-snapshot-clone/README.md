### Creating Clone volume

#### Description
Ensure that the volume can be created successfully using its snapshot.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Check if the provided snapshot is created in the cluster.
- Check if snapshot-promoter storageclass is created.
- Update the clone template with the input parameters such as snapshot name, storage class and the application namespace.
- Use clone creation utility to create clone.
- Check if the cloned volume is bound and can be usable.

#### Test Result

