### GV2D-Upgrading cStor pool and volumes.

#### Description

The goal of this to ensure that the cstor pool and volume deployment can be upgraded seamlessly.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which upgrades the OpenEBS volumes and pools and check if there is any impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- It Check if all the components are running.
- Start data traffic and check application liveness.
- The next litmusbook upgrades the storage components such as pool and target deployments to the latest version.
- It checks if all the components are running seamlessly post upgrade.

#### Expected result

- The given volume and pool should be upgraded to the specified version successfully without any impact.

#### Test Result 
 
