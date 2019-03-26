### Storage Classes creation.

#### Description

This job will create storage classes with the properties supported by OpenEBS.

#### Prerequisites

- OpenShift cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- Storage pool should be created.

#### Procedure

- The job should be capable of creating OpenEBS storage classes.
- Storage classes template should be updated with the storagepoolclaim name.
- The test should check if the OpenEBS storage classes are created using kubectl command `kubectl get sc`

#### Expected result

- Storage classes should be created successfully. 

#### Test Result

