### KLPX-Verify application availability upon inducing network delay in jiva replica pod.

#### Description

This test induces network delay on one of the jiva replica pods and check if it doesn't affect the application availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.

#### Procedure

- This job triggers the litmus experiments which induces packet delay on jiva replic pod.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS jiva Volume and check if the application is deployed successfully.
- Then, it induces network delay in jiva replica container and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result



 