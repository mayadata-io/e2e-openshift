### IFBV - Scale Up the cStor Volume Replica and check the status.

#### Description

The goal of this test is to scale up the cstor volume replica and check if its successfully scaled.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- An application should be deployed using cstor based on storage class with desired replica count.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job will deploy the application using cStor storage class with desired replica count.
- Scaled up the cStor volume Replica and check the application status and replica status.
- Verify the data synced in the newly created replica.

#### Expected result

- cStor volume replica should be scaled up successfully.
- Application writes should be happen successyfully.

#### Test result
