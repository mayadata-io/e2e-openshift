### 61D2-Verify application availability when node is powered off.

#### Description

This test fails a node by shutting it down and checks if the application using jiva based volume is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- jiva based storage pool should have been created.
- OpenEBS jiva storage class should be created.

#### Procedure

- This job triggers the litmus experiments which reboots a node on vmware server and verify if the application is scheduled on other node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys an application using jiva storage engine and dumps data into it.
- Then it fails the node where application is running and check if application is rescheduled and verify its availability.
- Finally, it deprovisions the application and update the result.

#### Expected result

- Application should be scheduled on some other node.

#### Test Result

