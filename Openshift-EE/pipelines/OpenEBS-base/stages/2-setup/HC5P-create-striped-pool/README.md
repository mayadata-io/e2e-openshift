### Create Storage Pool.

#### Description

This job that will create OpenEBS cStor based storage pool.

#### Prerequisites

- OpenShift cluster should be ready.
- Each node should have the disks attached depending on required pool configuration.

#### Procedure

- The job should be capable of creating SPC using disks.
- Check if the cStor pool is created using kubectl command `kubectl get spc`

#### Test Result