### Install OpenEBS.

#### Description

This job will configure OpenEBS on the OpenShift cluster enterprise cluster and check if all the components are healthy.

#### Prerequisites

- The OpenShift cluster should be ready.

#### Procedure

- The job installs OpenEBS components in the  OpenShift 3.10 cluster. By default, it created a new namespace called OpenEBS and installs the resources/objects inside that namespace.
- Check if all the OpenEBS components are installed using kubectl command `kubectl get pods -m openebs`

#### Test Result

