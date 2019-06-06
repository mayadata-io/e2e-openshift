### WHAP - Fill the volume capacity completely and resize it.

#### Description

The goal of this test is to fill cstor volume completely and check if its size can be scaled seamlessly.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- An application should be deployed using cstor based storage class.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job fills the cstor volume completely and exhausts its space.

#### TODO

- Need to scale the volume capacity when the feature is supported.

#### Expected result

- Application writes should not happen.

#### Test result

