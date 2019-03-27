### K9YC-Install OpenEBS in OpenShift Enterprise cluster.

#### Description

This job will deploy OpenEBS on OpenShift cluster enterprise cluster and check if all the components are healthy.

#### Prerequisites

- The OpenShift cluster should be ready.

#### Procedure

- This job triggers a litmus experiment which installs OpenEBS components in the OpenShift 3.10 cluster. By default, it creates a new namespace called OpenEBS and installs the OpenEBS objects inside that namespace.
- Check if all the OpenEBS components are installed using kubectl command `kubectl get pods -n openebs`
- Finally, this job updates the litmusresult CR with the actual result.

#### Expected Result

- This job should deploy OpenEBS components such as maya-apiserver, openebs-provisioner, openebs-snapshot-operator, openebs-ndm pods, openebs-admission-server and default cstor pool pods successfully.

#### Test Result

