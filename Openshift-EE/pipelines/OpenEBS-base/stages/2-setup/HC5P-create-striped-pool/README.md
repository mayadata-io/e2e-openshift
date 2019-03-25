### Create Storage Pool.

#### Description

This job that will create OpenEBS cStor based storage pool.

#### Prerequisites

- OpenShift cluster should be ready.
- Each node should have the disks attached depending on required pool configuration.

#### Procedure

- The job should be capable of creating SPC using disks.
- Check if the cStor pool is created using kubectl command `kubectl get spc`

 | Test ID |   Test Description               | Test Result   |
 |---------|---------------------------| --------------|
 |    HC5P-605   |  Create cStor based Striped storage pool on disks.           |  Pass     |

#### Test Result