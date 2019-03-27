### 72WM-Verify applicaton availablity post cStor pool pod failure.

#### Description

This test simulates cStor pool pod failure by deleting it and checks if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which induces failure on cStor pool pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then it induces cstor-pool pod failure by deleting it and verifies if the application is running successfully.
- Finally, deprovisions the statefulset application and update result.

#### Expected result

- Application should be running successfully and pod should be rescheduled again.

#### Test Result

