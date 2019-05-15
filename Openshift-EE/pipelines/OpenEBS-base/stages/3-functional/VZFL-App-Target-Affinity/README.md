### VZFL-Verify if the application and target are scheduled on same node.

#### Description

This test checks if the application pod and its corresponding target are scheduled on the same kubernetes node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which checks if the application pod in a deployment and its corresponding cstor target pod are scheduled on the same node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys a deployment application using openebs cstor based storage class.
- Post successful application deployment, the job checks if the application pod and its corresponding cstor target pod are scheduled on the same node.
- The job fails if they are not scheduled on same node.

#### Expected result

- The application pod and its corresponding cstor target pod should be scheduled on same node.

#### Test Result

