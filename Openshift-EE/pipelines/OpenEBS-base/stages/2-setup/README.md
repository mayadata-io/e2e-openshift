### Goal of this stage

The goal of this gitlab stage is to deploy OpenEBS components in OpenShift cluster and create the storage pools.

### Test Cases in OpenEBS-Setup Stage

The test cases in OpenEBS-Setup stage are as follows:

| S.No | TID  | Test case description                                        |
| ---- | ---- | ------------------------------------------------------------ |
| 1    | K9YC | Deploy OpenEBS in OpenShift-4.2 Cluster                      |
| 2    | 1CXH | Create K8s storage classes adhering the policies supported by OpenEBS |
| 3    | HC5P | Create cStor based Striped storage pool.                     |
| 4    | P7Q4 | Create cStor based storage pool of type mirrored             |
| 5    | 37Y6 | Create cStor based storage pool of RAIDZ type1               |
| 6    | 9ZWW | Create cStor based storage pool of RAIDZ type2               |
| 7    | KUSG | Create cStor CSPC Striped storage pool                       |
| 8    | AP1O | Deploy NFS provisioner using the storage engine cStor.       |
| 9    | PBCY | Deploy NFS provisioner using the storage engine JIVA.        |

