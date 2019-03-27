### ZD8F- Scaling up statefulset application replicas

#### Description

This test ensures that the application replicas can be scaled by updating its corresponding deployment.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which scales up application replica and ensures that the scaled replica consumes OpenEBS storage volume.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploy busybox statefulset application with two replicas using OpenEBS storage class and start data traffic in the application pod.
- Then it attempts to increase the application replica count to three using `kubectl scale` command.
- Finally, it Check if the new application pod is created and the ring is formed.

#### Expected result

- The new application replica should be created successfully. 

#### Test Result


