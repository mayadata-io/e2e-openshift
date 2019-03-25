### Creating volume snapshot

#### Description
The goal of this test is to enure that the volume snapshot can be created successfully.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy busybox application.
- Update the snapshot template with the pvc and namespace values.
- Use create-snapshot utility to create snapshot.
- Check if the snapshot is created successfully in all the associated storage pool pods.

#### Test Result
