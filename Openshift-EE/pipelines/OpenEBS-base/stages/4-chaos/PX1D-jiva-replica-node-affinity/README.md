### PX1D-Verify Jiva replica stickiness to node.

#### Description

This test checks if the jiva replica pod is sticked to a node.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created.
- OpenEBS storage class should be created and an application should be deployed using jiva storage engine.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job triggers the litmus experiments which cordons the node where replica pod is scheduled.
- Then the replica pod is deleted to check if it is getting scheduled on some other node.
- Then, uncordoning the node and verifying if the replica pod gets scheduled only on the uncordoned node.
- Finally, it deprovisions the application and update the result.

#### Expected result

Jiva replica pod should be sticking to the node where it was initially scheduled.

#### Test Result