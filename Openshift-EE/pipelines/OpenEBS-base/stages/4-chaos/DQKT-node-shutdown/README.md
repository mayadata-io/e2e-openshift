### DQKT-Verify application availablity when node is shutdown ungracefully.

#### Description

This test induce ungraceful node shutdown and check if the application is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which induces terminates the node ungracefully by shutting it down.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then it terminates the node where the application is running and check if the application is rescheduled and verify its availability.
- Finally it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be rescheduled and running successfully.

#### Test Result

