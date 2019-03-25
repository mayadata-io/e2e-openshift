### Upgrade application

#### Description
The goal of this test is to upgrade busybox application and check if it is usable and there is no impact in the storage.

#### Prerequisites
- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure
- Deploy busybox application.
- Pump data traffic and check application liveness.
- Trigger the litmusbook to upgrade the busybox application.
- Check if the application is running post upgrade.

#### Test result


