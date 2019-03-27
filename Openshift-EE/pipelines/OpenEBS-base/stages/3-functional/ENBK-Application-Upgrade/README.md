### ENBK-Upgrading busybox application

#### Description

The goal of this test is to upgrade busybox application and check if it is usable and there is no impact in the storage.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.

#### Procedure

- This job triggers the litmus experiments which upgrades an application and check if there is any impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- The job Pumps data traffic and check application liveness.
- The next litmus experiment attempts upgrading busybox application to the specified version.
- It checks if the application is running successfully post upgrade.

#### Expected result

- Application should be upgraded successfully to the specified version.

#### Test result


