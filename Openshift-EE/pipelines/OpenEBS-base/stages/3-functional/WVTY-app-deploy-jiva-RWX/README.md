### WVTY-Deploy application with rwx PV for NFS Provisioner using JIVA.

#### Description

Administrator should be able to use this job to deploy application with openebs volumes in read-write-many mode.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed in cluster.
- nfs provisioner should be deployed using jiva storage engine.

#### Procedure

- This job triggers litmus experiment which deploys application with openebs volumes in read-write-many mode.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- Litmus experiment checks if the application deployment is successful.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- Application deployment should be successful in rwx mode.

#### Test Result

