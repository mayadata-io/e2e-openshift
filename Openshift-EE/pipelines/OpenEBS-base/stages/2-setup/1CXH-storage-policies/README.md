### Storage Classes creation.

#### Description

This job will create the storage classes with the properties supported by OpenEBS.

#### Prerequisites

- OpenShift cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- Storage pool should be created.

#### Procedure

- The job should be capable of creating OpenEBS storage classes.
- Update the storage classes template with the storagepoolclaim name.
- Check if the OpenEBS storage classes are created using kubectl command `kubectl get sc`

#### Test Result

 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
|     1CXH-626                    |  Create K8s storage classes adhering the policies supported by OpenEBS           | Pass  |
|     1CXH-613                    |  Create K8s storage classes adhering the policies supported by OpenEBS           | Pass  |
 |    1CXH-605   |  Create K8s storage classes adhering the policies supported by OpenEBS           |  Pass     |
