#### openebs node service failure

#### Description

- This test induce kubelet service crash in the application node and check if application is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which inducesnetwork loss in cstor-pool container and check if the application is not impacted.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- Then, it crashes/stops the kubelet service in the node where application pod is running and verify if the application is running successfully.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be running successfully.

#### Test Result
