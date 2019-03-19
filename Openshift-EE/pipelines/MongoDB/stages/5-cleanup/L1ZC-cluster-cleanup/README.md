### Destroy cluster.

#### Description

This job will delete the OpenShift configuration.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed.
- cStor pool and storage class should be created.

#### Procedure

- The job should trigger the litmusbook which is capable of deleting OpenShift specific components in the cluster.
- The inputs such as vsphere IP address , Host name  as environmental variable to the ansible-runner pod which executes the test.

#### Test Result

