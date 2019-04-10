### UURF-Verify if the application pod and jiva controller are scheduled on same node.

#### Description

This test checks if the application pod and its corresponding jiva controller are scheduled on the same kubernetes node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.
- OpenEBS storage class using jivs cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the application pod and its corresponding jiva controller pod are scheduled on the same node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys a statefulset application using openebs jiva based storage class.
- Post successful application deployment, checks if the number of application replicas matches the desired value.
- And also, the job checks if each of the application replica pod and its corresponding jiva controller pod are scheduled on the same node.
- The job fails if they are not scheduled on same node.

#### Expected result

- The application replica pod and its corresponding jiva controller pod should be scheduled on same node.

#### Test Result

