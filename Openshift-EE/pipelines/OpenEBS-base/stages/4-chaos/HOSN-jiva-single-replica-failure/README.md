### HOSN-Fail jiva replica pod in single replica deployment.

#### Description

This test fails the jiva replica in single replica deployment and check if it is recovered successfully.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Openebs storage class with single jiva replica specification should be created..

#### Procedure

- This job triggers the litmus experiments which kills the jiva replica pod and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it kills the jiva replica pod and verify if it is recovered successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result

