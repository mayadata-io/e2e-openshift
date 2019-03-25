### Storage Classes creation.

#### Description

This job that will create the storage classes with the properties supported by OpenEBS.

#### Prerequisites

- K8s cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- Storage pool should be created.

#### Procedure

- The job should be capable of creating OpenEBS storage classes.
- Check if the OpenEBS storage classes are created using kubectl command `kubectl get sc`

#### Test Result
