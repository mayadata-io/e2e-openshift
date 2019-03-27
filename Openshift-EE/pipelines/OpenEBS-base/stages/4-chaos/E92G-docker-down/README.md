### E92G-Verify application availablity when docker is crashed on one of the nodes.

#### Description

This test stops docker service in a node and check if application is rescheduled and verify its availability.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which crashes/stops docker service in one of the nodes and verify application availability.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It deploys statefulset application consuming OpenEBS Volume and check if the application is deployed successfully.
- It induces docker service crash on the application node and check if the application pod is rescheduled and verify its availability.
- Finally, it deprovisions the statefulset application and update the result.

#### Expected result

- Application should be rescheduled to other node.

#### Test Result

 
