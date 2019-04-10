### KUL9-Verify if the application consuming Jiva storage can be scaled up.

#### Description

This test checks if the application replicas consuming jiva based storage can be scaled up.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva based storage pool should have been created. A default storage pool is created by default during OpenEBS deployment.
- OpenEBS storage class using jiva cas-type should be created.

#### Procedure

- This job triggers the litmus experiments which checks if the application replicas in a deployment /statefulset using jiva persistent volume can be scaled up.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job deploys an application using openebs jiva based storage class.
- Post successful application deployment, attempts to scale the application replica to higher value.
- After scaleup, the new ready-replica value should match the desired value.

#### Expected result

- The application replica pods should be scaled up successfully.

#### Test Result

