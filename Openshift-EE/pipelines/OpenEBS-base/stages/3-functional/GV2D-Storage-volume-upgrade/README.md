### Upgrade cStor pool and volumes.

#### Description
The goal of this to ensure that the cstor pool and volume deployment upgrade process is seamless.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy busybox application.
- Check if all the components are running.
- Start data traffic and check application liveness.
- Upgrade the storage components such as pool and target deployments to the latest version.
- Check if all the components are running seamlessly post upgrade.
- Make sure that the pool and target pods are using the latest version.

#### Test Result 
 
