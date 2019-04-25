### BF12-Verify application availablity when node is tainted due to disk-pressure taint.

#### Description

This test evicts a node due to disk-pressure taint and checks if the application is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which evicts a node due to disk failure taint and verify of the application is scheduled on other node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and checks if the application is deployed successfully.
- Then it evicts a node where application is running and check if application is rescheduled and verify its availability.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be scheduled on some other node.

#### Test Result

