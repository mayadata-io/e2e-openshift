### VO3D-Verify application availablity post jiva controller failure

#### Description

This test kills the jiva controller pod and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- jiva based storage class should have been created.

#### Procedure

- This job triggers the litmus experiments which kills the jiva controller pod and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it kills the jiva controller pod and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result

