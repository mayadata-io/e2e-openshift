### 4E0O-Scaling up the jiva replicas for a given volume.

#### Description

The goal of this test is to ensure that the Jiva volume replicas can be scaled up successfully.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- Jiva storage pool and storage class should be created.
- Application should be deployed using Jiva storage engine.

#### Procedure

- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job triggers the litmus experiments which checks if the Jiva volume replicas can be scaled up  successfully.
- The test patches the replica deployment by including node names under affinity spec for scheduling new replica pods.
- The litmus book checks if all the replicas are in RW state after scaling up successfully using mayactl command.

#### Expected result

- The Jiva replicas should be scaled up successfully.

#### Test Result