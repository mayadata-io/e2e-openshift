### 1CXH-OpenEBS Storage Classes creation.

#### Description

This job will create storage classes with the properties supported by OpenEBS.

#### Prerequisites

- OpenShift cluster should be created.
- OpenEBS should be deployed in K8s cluster.
- Storage pool should be created.

#### Procedure

- This job triggers the litmus experiment which is capable of creating OpenEBS storage classes.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest accordingly.
- This job updates the Storage classes template should with the storagepoolclaim name and initiates the required storage classes creation.
- The test should check if the OpenEBS storage classes are created using kubectl command `kubectl get sc`
- Finally, this job updates the result CR with the actual result.

#### Expected result

- The required OpenEBS storage classes should be created successfully.

#### Test Result

