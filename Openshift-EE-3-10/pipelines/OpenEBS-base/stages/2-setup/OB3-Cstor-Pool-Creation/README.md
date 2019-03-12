### Creating cStor storage pool

#### Description

This job has to create the cStor based storage pools using the disks provided.

#### Prerequisites

- Fully functional OpenShift cluster.
- OpenEBS deployed.
- Desired number of disks attached to each K8s node.
- Storage class.

#### Procedure

This job has to trigger the litmus book that can create the cStor storage pool using the disks provided.

The litmus book can be found here.

  https://github.com/openebs/litmus/tree/master/providers/cstor/cstor-disk-pool

#### Expected result

The cstor based pool should be created successfully which has to be verified using kubectl commands.

#### Test result

