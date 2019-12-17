### 36CY - Scale Down the cStor Volume Replica and check the status.

#### Description

The goal of this test is to scale down the cstor volume replica and check if its successfully scaled down.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- An application should be deployed using cstor based on storage class with desired replica count.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job will deploy the application using cStor storage class with desired replica count.
- Scaled down the cStor volume Replica and check the application status and replica status.

#### Expected result

- cStor volume replica should be scaled down successfully.
- Application writes should be happen successyfully.

#### Test result
