### 0FN8 - Deprovision the cStor volume based NFS on openshift cluster.

#### Description

Administrator should be able to use this job to cleanup the OpenEBS cStor based NFS provisioner.

#### Prerequisites

- OpenShift cluster should be ready.
- NFS provisioner should be running.

#### Procedure

- This job triggers litmus experiment which cleanup the NFS provisioner in openshift cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Deprovision the nfs provisioner version based on the specified environmental variable.
- This test checks if the desired deployment is cleaned completely.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- nfs provisioner deployment should be Removed from the cluster.

#### Test Result