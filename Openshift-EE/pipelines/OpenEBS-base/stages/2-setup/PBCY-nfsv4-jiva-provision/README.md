### PBCY-Create NFS provisioner on openshift cluster using JIVA Storage Engine.

#### Description

Administrator should be able to use this job to create NFS Provisioner using OpenEBS JIVA based storage engine.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS components should be deployed.

#### Procedure

- This job triggers litmus experiment which creates NFS provisioner in openshift cluster.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Deploy nfs provisioner version based on the specified environmental variable.
- This test checks if the desired deployment is created.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- nfs provisioner deployment should be successful.

#### Test Result
