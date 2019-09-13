### OpenEBS cleanup

#### Description

This job will delete the OpenEBS components installed in OpenShift cluster.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed.

#### Procedure

- The job should trigger the litmusbook which is capable of deleting OpenEBS specific components in the cluster.

- This should delete all the components in openebs namespace.

- This can be verified using kubectl command `kubectl get ns`

  

#### Test Result

