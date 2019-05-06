#### cstor-pool-mgmt conatiner kill.

#### Description

This test induce failure on cstor-pool-mgmt container in cstor-pool pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which induces failure on cstor-pool-mgmt container in cStor pool pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The litmus experiment deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then it induces cstor-pool-mgmt container kill chaos and verifies if the application is running successfully.
- Finally it deprovisions statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result
