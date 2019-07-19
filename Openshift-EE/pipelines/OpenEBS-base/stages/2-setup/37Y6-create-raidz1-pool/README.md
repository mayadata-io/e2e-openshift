### 37Y6-Create raidz1 Storage Pool using disks.

#### Description

Administrator should be able to use this job to create OpenEBS cStor based storage pool of type raidz1.

#### Prerequisites

- OpenShift cluster should be ready.
- OpenEBS should be deployed in cluster.
- Each node should have the disks attached depending on required pool configuration.

#### Procedure

- This job triggers litmus experiment which creates raidz1 storage pool using disks.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- This test checks if the required cStor pool is created successfully using kubectl command `kubectl get spc`
- This investigates if the corresponding cstor pool pods are running using SPC as label.
- Finally, this job updates the result CR with the actual result.

#### Expected result

- Storagepoolclaim should be created successfully and cStor pool pods should be running according to the maxpool count set.

#### Test Result


