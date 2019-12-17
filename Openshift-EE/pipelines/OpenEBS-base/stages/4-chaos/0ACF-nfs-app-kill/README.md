### 0ACF - Verifying application HA post cStor NFS provisioner application pod kill.

#### Description

This job ensures that the application runs seamlessly on inducing the cStor NFS provisioner pod kill.

#### Prerequisites

- OpenShift Cluster should be created and have the dependencies installed.
- cStor based storage pool should have been created.
- OpenEBS storage class should be created with the desired storage pool claim.
- NFS Provisioner should be created using cStor Storage Engine.

#### Procedure

- This job triggers the litmus experiments which induces failure on one of the application pods and ensures that there is no impact.
- The litmus experiment receives the necessary parameters in form of pod environmental variables and updates the manifest files accordingly.
- This job induces NFS provisioner application pod kill chaos and verify if the application pod that using the nfs provisioner is rescheduled and running successfully.

#### Expected result

- NFS provisioner pod rescheduled successfully and accessible.
- Application writes (RWX pv) that uses NFS provisioner cStor volume should be successfull.

#### Test Result

