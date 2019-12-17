### VTPW - Migration cStor Volume Replica from One Pool to another pool and check the status.

#### Description

The goal of this test is to migrate the cstor volume replica from one pool to another pool and check if its successfully Migrated.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- An application should be deployed using cstor based on storage class with desired replica count.
- Storage pool is available to Migrate the Volume. 

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job will deploy the application using cStor storage class with desired replica count.
- Migrate the cStor volume Replica to the new pool and check the application status and replica status.

#### Expected result

- cStor volume replica should be migrated to new pool successfully.
- Application writes should be happen successyfully.
- cStor volume replicas should be in Healthy state.

#### Test result

