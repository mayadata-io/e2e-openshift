### Z0KY-Verify cstor pool pod availability when node's capacity is exhausted.

#### Description

This test fills the node's capacity completely through a rogue pod and checks if the openebs pool pods are getting evicted.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which drains a node and verify if the application is scheduled on other node.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys busybox application and fills the node completely. As an impact, kubelet evicts the rogue pod. 
- Here, the test checks if there is any impact on the corresponding storage pool.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- OpenEBS cStor pool pod should not evicted. It should be running and healthy.

#### Test Result